# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: LightDot <lightdot -a-t- g m a i l>

_name=raleway
_fname=Raleway
pkgbase=$_name-font-git
pkgname=(otf-$_name-git ttf-$_name-git ttf-$_name-variable-git)
pkgver=4.100.r2.g9af4c69
pkgrel=1
pkgdesc='An elegant sans-serif font family, originally in a single thin weight, now 9 weights'
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
    fontship -q make
}

package_otf-raleway-git() {
    provides=("${pkgname%-git}" "${pkgbase%-git}")
    conflicts=("${pkgname%-git}")
    cd "$pkgbase"
    export GLOBIGNORE='*-VF.otf'
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" $_fname-*.otf
    # install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ttf-raleway-git() {
    provides=("${pkgname%-git}" "${pkgbase%-git}")
    conflicts=("${pkgname%-git}")
    cd "$pkgbase"
    export GLOBIGNORE='*-VF.ttf'
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" $_fname-*.ttf
    # install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ttf-raleway-variable-git() {
    provides=("${pkgname%-git}" "${pkgbase%-git}-variable")
    conflicts=("${pkgname%-git}")
    cd "$pkgbase"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" $_fname-VF.ttf
    # install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
