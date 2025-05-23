# Contributor: 173br <173brian at gmail dot com>
pkgname=android-aarch64-meson
pkgver=1
pkgrel=2
arch=('any')
pkgdesc="Meson wrapper for arm64 (aarch64)"
depends=('meson' 'aarch64-linux-gnu-gcc' 'android-pkg-config')
conflicts=('aarch64-linux-gnu-meson')
license=("GPL")
url=""
source=("toolchain_generator.py"
        "android-aarch64-meson")
sha256sums=('91fbae127a8dfc1be2054944fba5d6e942bedba9eecfd116e5525261cb7fe1ec'
            'bdcd08416190863e6f21f35b629c7f5e766e510085695e714487b7d31a5df143')

build() {
  python toolchain_generator.py --output-file toolchain-android-aarch64.meson 
}

package() {
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/aarch64
  install -m 755 "${srcdir}/toolchain_generator.py" "$pkgdir/usr/bin/meson-cross-android-aarch64-file-generator"
  install -m 755 "${srcdir}/android-aarch64-meson" "$pkgdir/usr/bin/android-aarch64-meson"
  install -m 644 toolchain-android-aarch64.meson "${pkgdir}"/usr/share/aarch64/
}
