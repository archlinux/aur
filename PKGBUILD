# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=meta-package-manager
_pkgname=${pkgname//-/_}
pkgver=8.0.0
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/79/ce/1b608ea6ce77d657fd1dc40681cec7dee6deceb5cb83d19be6a0fdd6881e/meta_package_manager-8.0.0.tar.gz")
sha512sums=('47c2e85f40378c80b81229b79c484119d0fa61c1edf8ff25a2d62da4e46aac3d01b8dd258503496f60a50f46dfee86bf546c136be95fe52852a5dca0ff0face5')

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
