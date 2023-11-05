# Maintainer: Donald Carr <sirspudd at gmail dot com>

pkgname=('clang-github-bin')
#pkgver=15.0.7
_pkgver=17.0.4
_pkg_suffix=
_pkgver_suffix=${_pkgver}
_pkgver_dash_suffix=${_pkgver}
if [[ -n ${_pkg_suffix} ]]; then
    _pkgver_suffix=${_pkgver_suffix}${_pkg_suffix}
    _pkgver_dash_suffix=${_pkgver_dash_suffix}-${_pkg_suffix}
fi
pkgver=${_pkgver_suffix}
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
filename=clang+llvm-${_pkgver_suffix}-x86_64-linux-gnu-ubuntu-22.04
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${_pkgver_suffix}/${filename}.tar.xz")
sha512sums=('abb966c41294d3f186c980f97aec94d82bc6da79cf15fbc3b1310bbce2306babe00db1e1c7c73a803c36117a7a6361a5a5b6a6de495afa982240dc5fc8299e3f')
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
