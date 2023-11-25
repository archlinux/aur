# Maintainer: Donald Carr <sirspudd at gmail dot com>

pkgname=('clang-github-bin')
#pkgver=15.0.7
_pkgver=17.0.5
_pkg_suffix=
_pkgver_suffix=${_pkgver}
_pkgver_dash_suffix=${_pkgver}
if [[ -n ${_pkg_suffix} ]]; then
    _pkgver_suffix=${_pkgver_suffix}${_pkg_suffix}
    _pkgver_dash_suffix=${_pkgver_dash_suffix}-${_pkg_suffix}
fi
pkgver=${_pkgver_suffix}
pkgrel=2
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
filename=clang+llvm-${_pkgver_suffix}-x86_64-linux-gnu-ubuntu-22.04
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${_pkgver_suffix}/${filename}.tar.xz")
sha512sums=('c60541e471cef79f593b5c4535ac0faec0299d75d585f468af4a1c183bdeeecc69f0e0e1214e0c5cc77b255816b51e0027de7a0bd56428dc78d601318b99166a')
install=clang.install

prefix_path="/opt/clang"
install_dir="${pkgver}-official"

_prepare_install_script() {
	cp ${startdir}/.clang.install ${startdir}/clang.install
	sed -i "s,CLANG_PREFIX,${prefix_path},g" ${startdir}/clang.install
	sed -i "s,CLANG_VERSION,${install_dir},g" ${startdir}/clang.install
}

package() {
    _prepare_install_script
	local install_path="${pkgdir}/${prefix_path}/${install_dir}"

	mkdir -p ${install_path}
	mv ${srcdir}/${filename}/* ${install_path}
}
