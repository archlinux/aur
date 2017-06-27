# vim:set ts=2 sw=2 et:
# Maintainer: 2GMon <t_2gmon@yahoo.co.jp>
pkgname=mikutter
#pkgver=3.5.0_alpha2
pkgver=3.5.8
pkgrel=2
pkgdesc="a moest twitter client"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
depends=(
'ruby-gtk2>=2.2.3' 'ruby-moneta' 'ruby-nokogiri' 'ruby-httpclient' 'ruby-mini_portile2' 'ruby-totoridipjp'
'ruby-gettext' 'ruby-native-package-installer'
)
optdepends=('libnotify: notify support')
source=(
#http://mikutter.hachune.net/bin/$pkgname.$pkgver.tar.gz
http://mikutter.hachune.net/bin/$pkgname.`echo "$pkgver" | tr "_" '-'`.tar.gz
mikutter.desktop
)

package() {
  # mikutter require cairo-gobject 3.1.6 but https://aur.archlinux.org/packages/ruby-cairo-gobject/ is old (3.1.3)
  mkdir "$srcdir/$pkgname/gems"
  gem install --no-user-install -i "$srcdir/$pkgname/gems" cairo-gobject

  mkdir "$pkgdir/opt"
  cp -r "$srcdir/$pkgname" "$pkgdir/opt"

  mkdir -p "$pkgdir/usr/bin"
  cat <<'EOF' > "$pkgdir/usr/bin/mikutter"
#!/bin/sh
ruby /opt/mikutter/mikutter.rb $@
EOF
  chmod a+x "$pkgdir/usr/bin/mikutter"

  mkdir -p $pkgdir/usr/share/applications
  cp "$srcdir/mikutter.desktop" "$pkgdir/usr/share/applications"
  chmod +x $pkgdir/usr/share/applications/mikutter.desktop
}


md5sums=('75d601ec00081204fb06b49782fd71f7'
         '18e28a76097af88457462b08752382df')
