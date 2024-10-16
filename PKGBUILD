# Maintainer: Troplo <troplo@troplo.com>
pkgname=flowinity
pkgname_internal=flowinity-desktop
pkgver=1.0.7
pkgrel=1
pkgdesc="The dashboard for your digital life. Store and share images, write documents, and talk with your friends. (Source version)"
arch=('x86_64')
url="https://flowinity.com"
license=('GPL-3.0-only')
makedepends=('yarn' 'git' 'nodejs')
source=("$pkgname_internal-$pkgver.zip::https://github.com/Flowinity/Desktop/archive/refs/tags/$pkgver.zip"
        "${pkgname_internal}.desktop"
        "flowinity.png")
conflicts=('flowinity-bin')
provides=('flowinity-bin')

build() {
    local sourcedir="$srcdir/Desktop-$pkgver"
    cd "$sourcedir"
    patch -Np1 -i ../../builder.patch

    yarn install

    yarn build:linux
}

package() {
  local sourcedir="$srcdir/Desktop-$pkgver"
  install -d "${pkgdir}/opt/${pkgname_internal}"

  local tarball="$sourcedir/dist/$pkgname_internal-$pkgver.tar.gz"

  tar -xzf $tarball -C "${pkgdir}/opt/${pkgname_internal}"

  mv "${pkgdir}/opt/${pkgname_internal}/${pkgname_internal}-${pkgver}"/* "${pkgdir}/opt/${pkgname_internal}/"

  install -Dm644 ${srcdir}/${pkgname_internal}.desktop ${pkgdir}/usr/share/applications/${pkgname_internal}.desktop

  install -Dm644 ${srcdir}/flowinity.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/flowinity.png

}
sha256sums=('1f4d1563e476195a8baceba7a6cfd5b0d16cb3b24e86a9878572de392391099d'
            'c7c22501503c13cfe7132b8677c6fc1c38471cf02516c55c92888d0afc96fcbb'
            '7e1c3148491581e1e73164402acb5dbd61e60c2143292cf6c4b37a31c07a4c9c')
sha256sums=('1f4d1563e476195a8baceba7a6cfd5b0d16cb3b24e86a9878572de392391099d'
            'c7c22501503c13cfe7132b8677c6fc1c38471cf02516c55c92888d0afc96fcbb'
            '7e1c3148491581e1e73164402acb5dbd61e60c2143292cf6c4b37a31c07a4c9c')
