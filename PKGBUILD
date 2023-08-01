# Maintainer: nobodyinperson <nobodyinperson at posteo de>
# Contributor: AlphaJack <alpha at tuta dot io>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname="opentimestamps-client-git"
pkgver=0.7.1.r2.g7be45f0
pkgrel=1
pkgdesc="Command-line tool to create and validate timestamp proofs with the OpenTimestamps protocol"
license=("LGPL3")
arch=("any")
provides=("opentimestamps-client")
url="https://github.com/opentimestamps/opentimestamps-client"
depends=(python-{opentimestamps,appdirs,gitpython,pysocks})
makedepends=("git" "python-setuptools")
checkdepends=("python-gitpython")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "opentimestamps-client"
 git describe --long --tags | sed 's/^opentimestamps-client-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
 cd "opentimestamps-client"
 python setup.py build
}

check(){
 cd "opentimestamps-client"
 python -m unittest discover -v
}

package(){
 cd "opentimestamps-client"
 python setup.py install --skip-build --root="$pkgdir" --optimize=1
 install -m755 ots-git-gpg-wrapper.sh -Dt "$pkgdir"/usr/bin
}
