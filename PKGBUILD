# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=meta-package-manager
_pkgname=${pkgname//-/_}
pkgver=7.6.1
pkgrel=2
pkgdesc='A wrapper around all package managers'
url='https://kdeldycke.github.io/meta-package-manager/'
makedepends=(python-build python-installer python-uv-build)
depends=(python python-boltons python-click-extra python-extra-platforms python-packageurl python-tomli-w python-xmltodict)
checkdepends=(python-pytest python-pytest-cov python-pytest-randomly python-pytest-xdist)
optdepends=('apt: support for apt packages'
            'rust: support for Rust packages'
            'composer: support for PHP composer packages'
            'dnf: support for RPM packages'
            'portage: support for Gentoo packages'
            'flatpak: support for Flatpak packages'
            'rubygems: support for Ruby packages'
            'npm: support for Node.js packages'
            'opkg: support for OPKG packages'
            'pacaur: support for AUR packages'
            'pacman: support for Pacman packages'
            'paru: support for AUR packages'
            'python-pip: support for Python packages'
            'python-pipx: support for Python pipx packages'
            'python-cyclonedx-lib: SBOM CycloneDX output (mpm sbom)'
            'python-spdx-tools: SBOM SPDX output (mpm sbom)'
            'snapd: support for Snap packages'
            'steamcmd: support for Steam games'
            'uv: support for Python packages'
            'code: support for VSCode extensions'
            'yarn: support for Node packages'
            'yay: support for AUR packages'
            'zypper: support for RPM packages')
license=('GPL-2.0-or-later')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/0c/d7/40a3c0ba8a2dbdc177ad3138d9862d3733e0f4356b13f81dcf7f30eb7041/meta_package_manager-7.6.1.tar.gz")
sha512sums=('aee6f41b9f0be0a063ba59ef5aa9666378a0a6b00b32f20ae9bcf0fcc196bec195ddf20e96a556fb0067c9111872ce525326f2edc00bc8f9d2b2c7f07376ee8c')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    pytest -m "not integration"
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}
