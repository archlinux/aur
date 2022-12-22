# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=goverlay-bin
_id="io.github.benjamimgois.${pkgname%-bin}"
_pkgver=0_9_1
pkgver=${_pkgver//_/.}
pkgrel=2
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('mangohud' 'qt5pas')
optdepends=('vkbasalt: Configure vkBasalt'
            'glxgears: OpenGL preview'
            'vulkan-tools: Vulkan preview'
            'git: Clone reshade repository'
            'replay-sorcery: Instant replay solution'
            'ttf-dejavu: recommended font'
            'ttf-ubuntu-font-family: recommended font'
            'breeze: for Breeze style')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/$pkgver/${pkgname%-bin}_${_pkgver}.tar.xz"
        "${pkgname%-bin}-$pkgver.1::$url/raw/$pkgver/data/${pkgname%-bin}.1"
        "$_id-$pkgver.desktop::$url/raw/$pkgver/data/$_id.desktop"
        "$_id.metainfo-$pkgver.xml::$url/raw/$pkgver/data/$_id.metainfo.xml"
        "${pkgname%-bin}-$pkgver.png::$url/raw/$pkgver/data/icons/512x512/${pkgname%-bin}.png")
sha256sums=('6885e8052d747fd19649c2b5b8273ea879b9046fa21cfa81f8570faaeae00bab'
            'e92cab07935d0f8bd76fb0a36f1b544a6510f3466f42fee989ceef454ec0189c'
            '4d3493dc383ee336f4451ab09604632214e0be6562df69ee30a2721bc08df989'
            'a83b788c6ed87e6a33531eb51b967cfb4db610a1f8546fba38321fa2ba101166'
            '82baf73d583dd13f1073b2b8d6aa7edc0c558521a46d77bdf1a88cc401e7cc7f')

prepare() {
  sed -i "s|./${pkgname%-bin}|/usr/lib/${pkgname%-bin}|g" "start_${pkgname%-bin}.sh"
}

package() {
  install -Dm755 "start_${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/lib/"
  install -Dm644 "${pkgname%-bin}-$pkgver.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
  install -Dm644 "$_id-$pkgver.desktop" "$pkgdir/usr/share/applications/$_id.desktop"
  install -Dm644 "$_id.metainfo-$pkgver.xml" "$pkgdir/usr/share/metainfo/$_id.metainfo.xml"
  install -Dm644 "${pkgname%-bin}-$pkgver.png" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
}
