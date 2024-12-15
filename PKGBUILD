# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=peergos-git
_pkgname=peergos
pkgver=0.22.0.r5.g49ba217
pkgrel=1
pkgdesc="A p2p, secure file storage, social network and application protocol"
url="https://github.com/Peergos/web-ui"
arch=('x86_64')
license=('AGPL3')
makedepends=('ant' 'git')
depends=('java-environment>=11'
         'java-environment-openjdk>=11') # have to specify java 11 or greater
provides=('peergos')
conflicts=('peergos')
source=("git+$url"
        "$_pkgname.sh"
        "$_pkgname-LICENSE::https://raw.githubusercontent.com/Peergos/Peergos/master/Licence.txt"
        "$_pkgname-webui-LICENSE::https://raw.githubusercontent.com/Peergos/web-ui/master/LICENSE")
sha256sums=('SKIP'
            '37c237b578c5a1828cae720daaf6059e0451c0f9ab618089b9e8b3d972d327a6'
            '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6'
            '589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd web-ui
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd web-ui
  ant dist
}

# followed guidelines here
# https://wiki.archlinux.org/title/Java_package_guidelines
package() {
  install -Dm755 "web-ui/server/Peergos.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname-LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/$_pkgname-LICENSE"
  install -Dm644 "$_pkgname-webui-LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/$_pkgname-webui-LICENSE"
}
