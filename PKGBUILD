# Maintainer: revsuine <pid1 at revsuine dot xyz>
_pkgname=disable-c6-runit
pkgname=$_pkgname-git
pkgver=1.r0.g4dc1fd1
pkgrel=1
pkgdesc="Simple runit script to disable the C6 power saving state on AMD Zen processors using zenstates.py"
arch=("x86_64")  # Zen is x86_64
url="https://codeberg.org/revsuine/$_pkgname"
license=('GPL-3.0-or-later')
depends=("runit"
    "zenstates-git")
makedepends=("git")
provides=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/$_pkgname"
    # from Arch Wiki: https://wiki.archlinux.org/title/VCS_package_guidelines#Git
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    echo "$url"
    service_dir="/etc/runit/sv"
    echo "Warning: This package assumes that $service_dir is where you store runit services. If your service directory is elsewhere, you can easily edit the PKGBUILD to reflect your service directory."
    
    install_dir="${pkgdir}${service_dir}/disable-c6"
    mkdir -p "$install_dir"
    install -Dm 744 "${srcdir}/${_pkgname}/disable-c6"/* -t "$install_dir"
}
