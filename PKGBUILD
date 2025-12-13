# Maintainer: @kjlsai <zhangjian@sipeed.com>

_name='maixpy'
_py=3.13
pkgname="python-${_name}"
pkgver=4.12.1
pkgrel=1
pkgdesc='Sipeed Maix Vision Python SDK'
url='https://github.com/sipeed/MaixPy'
arch=('x86_64')
license=('Apache-2.0')
depends=('python-maixtool' "python>=${_py}")
makedepends=('python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/cp${_py//./}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-cp${_py//./}-cp${_py//./}-manylinux2014_x86_64.whl")
b2sums=('4dfbfa737406aeba5d0e5940a541ca396fcee3cfda9c730a2c275d99c40ffdee23a05f161b8c0e81d2675cd909240859c962a714a9cc1cf518ae52d8c51b1df2')

package() {
    local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
	local source_url_var="source[@]"
	local source_url="${!source_url_var}"
	local wheel_file="${source_url##*/}"

	cd "${srcdir}"
	python -m installer --destdir="${pkgdir}" "${wheel_file}"

	install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -vsf "${site_packages}/${_name}-${pkgver}.dist-info/licenses/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
