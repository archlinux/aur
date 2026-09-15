# Maintainer: taotieren <admin@taotieren.com>

pkgname=ldscript-generator
pkgver=20.08.00.00
pkgrel=5
epoch=
pkgdesc="This is a python tool based on pydevicetree (GitHub/PyPI) which generates linker scripts for Freedom Metal applications."
arch=('any')
url="https://github.com/sifive/ldscript-generator"
license=('Apache-2.0')
groups=('sifive')
depends=(
    git
    'sh'
    'python'
    'python-jinja'
    'python-jinja-time'
    'python-markupsafe'
    'python-pylint'
    'python-pydevicetree')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('9a9e4492a71ebfa9890e5d03310651095f9e7c3588aff300b2c5df00c0cd0abe')
#validpgpkeys=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {
    install -dm0755 "${pkgdir}/usr/share/sifive/${pkgname}" \
        "${pkgdir}/usr/bin"

    cd "${srcdir}/${pkgname}"
    cp -r $(ls -d */) "${pkgdir}/usr/share/sifive/${pkgname}"
    cp -r memory_map.py "${pkgdir}/usr/share/sifive/${pkgname}"
    cp -r generate_ldscript.py "${pkgdir}/usr/share/sifive/${pkgname}"
    ln -sf "/usr/share/sifive/${pkgname}/generate_ldscript.py" "${pkgdir}/usr/bin/${pkgname}"
}
