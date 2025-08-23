# Maintainer: @kjlsai <zhangjian@sipeed.com>

_name='maixpy'
_py=3.13
pkgname="python-${_name}"
pkgver=4.11.9
pkgrel=1
pkgdesc='Sipeed Maix Vision Python SDK'
url='https://github.com/sipeed/MaixPy'
arch=('x86_64')
license=('Apache-2.0')
depends=('python-maixtool' "python>=${_py}")
makedepends=('python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/cp${_py//./}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-cp${_py//./}-cp${_py//./}-manylinux2014_x86_64.whl")
b2sums=('c6da563297a04598951a2db1d624875fafe01f4fa29d2ce46b0a34d4ef4117b32577a8af2976123d947164e7112eec040410ac9bee448088d7eeef6ef781d089')

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
