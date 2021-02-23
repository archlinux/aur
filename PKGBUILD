pkgname=grapejuice-git
_pkgname=grapejuice
_repository=https://gitlab.com/brinkervii/grapejuice.git
pkgver=2.2.7
pkgrel=3
pkgdesc='Simple Wine+Roblox management tool'
arch=('x86_64')
url="${_repository}"
depends=(
    'python-pip'
    'python-gobject'
    'python-psutil'
    'python-packaging'
    'python-dbus'
    'python-requests'
    'python-wheel'
    'python-setuptools'
    'cairo'
    'gtk3'
    'gobject-introspection'
    'desktop-file-utils'
    'xdg-utils'
    'xdg-user-dirs'
    'gtk-update-icon-cache'
    'shared-mime-info'
    'lib32-gnutls'
    'lib32-openssl'
)
provides=("${_pkgname}")
license=('GPL3')
source=("${_pkgname}"::git+"${_repository}")
sha256sums=('SKIP')

_python_version=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')

package() {
    project_root=$srcdir/grapejuice
    pushd "${project_root}"

    export PYTHONPATH=$project_root/src
    python3 -m grapejuice_packaging linux_package

    built_package_root=${project_root}/dist/linux_package
    pushd "${built_package_root}"
    tar -xf *.tar.gz -C "${pkgdir}"

    mv "${pkgdir}/usr/lib/python3/dist-packages" "${pkgdir}/usr/lib/python${_python_version}"
    rm -r "${pkgdir}/usr/lib/python3"

    popd
    popd
}