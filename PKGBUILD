# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=meta-package-manager
pkgver=7.0.1
pkgrel=1
pkgdesc='A wrapper around all package managers'
url='https://kdeldycke.github.io/meta-package-manager/'
makedepends=(git uv)
depends=(python python-boltons python-click-extra python-extra-platforms python-cyclonedx-lib python-more-itertools python-packageurl python-spdx-tools python-tomli-w python-tomli python-xmltodict python-backports)
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
            'snapd: support for Snap packages'
            'steamcmd: support for Steam games'
            'uv: support for Python packages'
            'code: support for VSCode extensions'
            'yarn: support for Node packages'
            'yay: support for AUR packages'
            'zypper: support for RPM packages')
license=('GPL-2.0-only')
arch=('any')
source=("git+https://github.com/kdeldycke/${pkgname}.git#tag=v$pkgver")
sha512sums=('a674ce4bbdf738ef49a2b10fc9dcb488e61b1d0ff86a4e33ac9ab07afb6f87fc6139f061dc96628ce79005927968393bb09b99dfa5767ed5e619b0081263df7f')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
    cd "$srcdir/$pkgname"
    uv build
}

package() {
    cd "$srcdir/$pkgname"
    uv pip install --system --link-mode=copy --no-deps --prefix="$pkgdir/usr" dist/*.whl
    rm "$pkgdir/usr/.lock"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}
