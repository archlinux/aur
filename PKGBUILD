# Maintainer: orumin <dev@orum.in>

pkgname=mikutter-git
pkgver=3.4.2.r0.gdf0a70c
pkgrel=1
pkgdesc="a moest twitter client (Upstream version)"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
depends=('ruby-gtk2>=2.2.3' 'ruby-moneta' 'ruby-nokogiri' 'ruby-mini_portile2' 'ruby-httpclient' 'ruby-memoize' 'ruby-memoist' 'ruby-delayer-deferred' 'ruby-typed-array' 'ruby-addressable' 'ruby-oauth' 'ruby-gettext' 'ruby-pluggaloid' 'ruby-twitter-text' 'ruby-totoridipjp')
makedepends=('git')
optdepends=('libnotify: notify support')
conflicts=('mikutter')
provides=('mikutter')
source=("${pkgname}::git://toshia.dip.jp/mikutter.git"
        'mikutter.desktop')
md5sums=('SKIP'
         '18e28a76097af88457462b08752382df')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  install -dm 755 "${pkgdir}/opt"
  cp -pr "${srcdir}/${pkgname}" "${pkgdir}/opt/mikutter"

  install -dm 755 "${pkgdir}/usr/bin"
  cat <<'EOF' > "${pkgdir}/usr/bin/mikutter"
#!/bin/sh
ruby /opt/mikutter/mikutter.rb $@
EOF
  chmod a+x "${pkgdir}/usr/bin/mikutter"

  install -Dm 755 "${srcdir}/mikutter.desktop" "${pkgdir}/usr/share/applications/mikutter.desktop"
}

# vim:set ts=2 sw=2 et:
