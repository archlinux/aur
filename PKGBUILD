pkgname="kitchenowl"
pkgver=0.4.4
pkgrel=1
pkgdesc="KitchenOwl is a self-hosted grocery list and recipe manager."
arch=("x86_64")
url="https://github.com/TomBursch/kitchenowl"
license=("GPL3")
source=(
  "kitchenowl.png"
  "kitchenowl.desktop"
  "${pkgname%}-${pkgver}.tar.gz::https://github.com/TomBursch/kitchenowl/releases/download/v${pkgver}/kitchenowl_Linux.tar.gz"
)
sha256sums=(
  "06f7b7e317e1732feda0bce957af7bf7b8a797147d865951df21532cb949863b"
  "8ec1df01450010aefb23728c69b8ff6eb2d9ceae9e1e1464374c6f0ae36a30c1"
  "4fceaa89a54de1f63567268ccfcd10baecb50d162bd3272eddcb4ba72114ee52"
)

package() {
    install -d "$pkgdir/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"

    cp -r "$srcdir/data" "$pkgdir/opt/${pkgname}/"
    cp -r "$srcdir/lib" "$pkgdir/opt/${pkgname}/"
    cp "$srcdir/kitchenowl" "$pkgdir/opt/${pkgname}/"

    ln -s "$pkgdir/opt/${pkgname}/kitchenowl" "${pkgdir}/usr/bin/kitchenowl"
    chmod +x "${pkgdir}/usr/bin/kitchenowl"
    install -Dm644 "${srcdir}/kitchenowl.png" "${pkgdir}/usr/share/icons/kitchenowl.png"
    install -Dm644 "${srcdir}/kitchenowl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
