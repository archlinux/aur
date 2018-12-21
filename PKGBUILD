# Maintainer: Aanok <aanok.aur@gmail.com>
pkgname=pmcli-git
pkgver=r50.b3a038f
pkgrel=1
pkgdesc="Command line client for Plex Media Server"
arch=('x86_64')
url="https://github.com/Aanok/pmcli"
license=('MIT')
depends=('lua' 'lua-http' 'lua-dkjson' 'mpv')
makedepends=('git')
provides=("${pkgname%-git}")
source=('git+https://github.com/Aanok/pmcli.git')
md5sums=('SKIP')
pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  cd "$srcdir/${pkgname%-git}"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE.md"
  
  cd "src"
  for file in *.lua; do
    install -D -m644 "$file" "${pkgdir}/usr/share/lua/5.3/pmcli/$file"
  done
  
  sed -i 's/^/#!\/bin\/env lua\n/' pmcli.sh
  install -D -m655 pmcli.sh "${pkgdir}/usr/local/bin/pmcli"
}
