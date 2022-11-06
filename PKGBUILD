# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=dbt-snowflake
pkgver=1.3.0
pkgrel=1
pkgdesc="All of the code enabling dbt to work with Snowflake"
url="https://github.com/dbt-labs/dbt-snowflake"
arch=('any')
license=('Apache')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python')
sha256sums=('8f6e5a7e10c6d783cea073c92760118b0fac5fb1af92cd008a016fae8938a3c1')
options=('!strip')

package() {
    cd "${pkgname}-${pkgver}"

    _pkgshare="${pkgdir}/usr/share"
    _pkgbin="${pkgdir}/usr/bin"
    _venv="${_pkgshare}/${pkgname}"

    # Create virtualenv
    mkdir -p "${_pkgshare}"
    python -m venv "${_venv}"
    source "${_venv}/bin/activate"

    # Install package in virtualenv
    pip install . 

    # Remove references to pkgdir
    sed -e "s|${pkgdir}||g" -i ${_venv}/bin/*

    # Link dbt binary
    mkdir -p "${_pkgbin}"
    ln -s "${_venv}/bin/dbt" "${_pkgbin}/dbt"
}
