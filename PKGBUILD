# Maintainer: kageru <kageru[at]encode[dot]moe>

_plug=vsutil
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r26.90c602b
pkgrel=1
pkgdesc='A collection of general purpose Vapoursynth functions to be reused in modules/scripts'
arch=('x86_64')
url='https://github.com/Irrational-Encoding-Wizardry/vsutil'
license=('MIT')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vsutil.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
    cd "${_plug}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_plug}"
    echo "asdqasdas"
    install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
    python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
    python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
