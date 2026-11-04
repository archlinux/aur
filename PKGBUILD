# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=dmenu-lpass-nu
pkgver=1.0.2
pkgrel=3
pkgdesc="dmenu script for lastpass-cli with account name and account user"
arch=("any")
url="https://smoolak.com/git/Smoolak/dmenu-lpass-nu"
license=('GPL-3.0-or-later')
# Both supported implementations provide the Bash associative-array interface.
# bash-git declares an unversioned capability, so guard concrete versions below.
depends=("bash" "lastpass-cli" "dmenu")
conflicts=('bash<4' 'bash-git<4')
checkdepends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'test-selection.py')
sha256sums=('c5d6fc64477ac9c0ea97be83fff8dbdd75bd615ed9bfd57858338a83ea48ea44'
            '0ecc7eeb9e23ca1f890b4e38ac3bf89f0234aa591c84bb876991aa9e63a4e97e')

check() {
    bash -n "${pkgname}/dmenu-lpass.sh"
    python "$srcdir/test-selection.py" "$srcdir/${pkgname}/dmenu-lpass.sh"
}

package() {
    install -Dm755 "${pkgname}/dmenu-lpass.sh" "$pkgdir/usr/bin/$pkgname"
}
