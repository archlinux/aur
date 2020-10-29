# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_name=league-spartan
_fname=LeagueSpartan
pkgbase=$_name-font-git
pkgname=(otf-$_name-git ttf-$_name-git ttf-$_name-variable-git)
pkgver=2.220.r1.g8811c61
pkgrel=1
pkgdesc='A geometric sans-serif revival of ATF’s classic Spartan'
arch=('any')
url="https://www.theleagueofmoveabletype.com/$_name"
license=('OFL')
groups=('lmt-fonts')
makedepends=('fontship' 'git')
source=("$pkgbase::git+https://github.com/theleagueof/$_name.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgbase"
    git describe --long --tags --abbrev=7 HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgbase"
    fontship make
}

package_otf-league-spartan-git() {
    provides=("${pkgname%-git}" "${pkgbase%-git}")
    conflicts=("${pkgname%-git}")
    cd "$pkgbase"
    export GLOBIGNORE='*-VF.otf'
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" $_fname-*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ttf-league-spartan-git() {
    provides=("${pkgname%-git}" "${pkgbase%-git}")
    conflicts=("${pkgname%-git}")
    cd "$pkgbase"
    export GLOBIGNORE='*-VF.ttf'
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" $_fname-*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ttf-league-spartan-variable-git() {
    provides=("${pkgname%-git}" "${pkgbase%-git}-variable")
    conflicts=("${pkgname%-git}")
    cd "$pkgbase"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" $_fname-VF.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
