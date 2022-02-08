# Contributor: Ben Wolsieffer <benwolsieffer@gmail.com>
# Contributor: Jan Cholasta <grubber at grubber cz>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
_base=nss
pkgname=python-${_base}
pkgver=1.0.1
pkgrel=2
pkgdesc="Python bindings for NSS and NSPR"
arch=(i686 x86_64)
url="https://firefox-source-docs.mozilla.org/security/${_base}/legacy/python_binding_for_${_base}"
license=(MPL GPL LGPL)
depends=(python nss)
makedepends=(python-setuptools)
source=("https://ftp.mozilla.org/pub/security/${pkgname}/releases/PYNSS_RELEASE_${pkgver//./_}/src/${pkgname}-${pkgver}.tar.bz2"
  "conflicts.patch::https://git.pld-linux.org/?p=packages/${pkgname}.git;a=blob_plain;f=type-conflicts.patch")
sha512sums=('88fc5a066a54524f0dd73cba8947bb3cd4cc078cf59a72253f0e56d835f39679a10a4ee87b5d9f4c167d0ff7a40704dee2e4d890e1d304afbe346ba02b8750b9' '503450330757fba1c51329bcf583797df2689aa9bf0ae6c78ca6bcc71302c8ee7986a23d412a65a455c9d84742125a7f24d7372f67d62c3bac764175191e812c')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../conflicts.patch
}

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.gpl -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
