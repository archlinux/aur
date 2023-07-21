# Contributor: Bane Nicovic <banenicovic at gmail dot com>
# Maintainer:: Bane Nicovic <banenicovic at gmail dot com>

pkgname="ms-teams-for-linux-bin"
pkgver=1.2.7
pkgrel=1
pkgdesc="Unofficial Microsoft Teams for Linux client (binary version)"
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=("GPL3")
arch=("x86_64")
provides=("teams-for-linux")
conflicts=("teams-for-linux"
           "teams-for-linux-appimage"
           "teams-for-linux-git"
           "teams-for-linux-wbundled-electron"
          )
depends=("electron24" "bash")
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
sha256sums_x86_64=('d5284c6f8a6d2b5ff6947821af3f7066c8cd1d9463b2c1a6d6bfedfb65120d95')
options=("!strip")


package(){
 tar -xf "data.tar.xz" -C $pkgdir
 find "$pkgdir"/opt -type f -not -path "*resources/*" -delete
 find $pkgdir -name "*.desktop" -exec sed -i -r "s!^Exec=.*!Exec=electron24 /opt/teams-for-linux/resources/app.asar!" {} \;
}
