# Maintainer: Leone <comdir@infonix.info>
pkgname=yd-go
pkgver=cfa24b6
pkgrel=1
epoch=
pkgdesc="Panel indicator for Yandex-disk CLI daemon (linux)"
arch=('x86_64')
url="https://github.com/slytomcat/yd-go"
license=('GPL-3.0-only')
groups=()
depends=("yandex-disk")
makedepends=("gendesk")
checkdepends=()
optdepends=()
provides=()
conflicts=("yd-go-git")
#replaces=()
#backup=()
options=('!strip' '!debug')
install=
changelog=
source=("https://github.com/slytomcat/yd-go/releases/download/master-${pkgver}/yd-go"
yd-go.png)

#noextract=()
b2sums=('02de3216ecd1d52e340ebe4abfe838399183993419c68c19be81a39340497d7a7884059d6cfa62daa5723705d26612669371fa4836204f9afe6d4bcfc35b196a'
        '647865327ba584fdc36ddc37e85b6457af6ca888d1b25479a7b8a94a81d0629a71c954a21c8604ef5e96c529178fcf9c4b6fd82df41a1ab6a9ab2d5c281c2c41')


validpgpkeys=()

prepare() {
	
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories="GTK;GNOME;X-GNOME-NetworkSettings;Network;" \
    --icon "/usr/share/pixmaps/${pkgname}.png" \
    --exec "yd-go"
	
}

package() {
  install -Dm755 "${srcdir}/yd-go" "${pkgdir}/opt/yd-go/yd-go"
  mkdir -p "${pkgdir}/usr/bin"
 # ln -s "/opt/yd-go/yd-go" "${pkgdir}/usr/bin/yd-go"
  install -Dm644 "${srcdir}/yd-go.desktop" "${pkgdir}/usr/share/applications/yd-go.desktop"
  install -Dm644 "${srcdir}/yd-go.png" "${pkgdir}/usr/share/pixmaps/yd-go.png"
}

post_install() {
  cd /usr/bin
  ln -s /opt/ya-go/yd-go yd-go
}
