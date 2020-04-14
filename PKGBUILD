# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_name=league-spartan
pkgbase=$_name-font-git
pkgname=(otf-$_name-git ttf-$_name-git ttf-$_name-variable-git)
pkgver=2.201.r1.g3675ae1
pkgrel=2
pkgdesc='A geometric sans-serif revival of ATF’s classic Spartan'
arch=('any')
url="https://www.theleagueofmoveabletype.com/$_name"
license=('OFL')
groups=('lmt-fonts')
makedepends=('gftools' 'python-fontmake' 'sfnt2woff-zopfli' 'ttfautohint')
source=("$_name-git::git+https://github.com/theleagueof/$_name.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_name-git"
    git describe --tags --abbrev=7 HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_name-git"
    ./build.sh
}

package_otf-league-spartan-git() {
    provides=("${pkgname%-git}" "${pkgbase%-git}")
    conflicts=("${pkgname%-git}")
    cd "$_name-git"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/static/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}

package_ttf-league-spartan-git() {
    provides=("${pkgname%-git}" "${pkgbase%-git}")
    conflicts=("${pkgname%-git}")
    cd "$_name-git"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/static/ttf/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}

package_ttf-league-spartan-variable-git() {
    provides=("${pkgname%-git}" "${pkgbase%-git}-variable")
    conflicts=("${pkgname%-git}")
    cd "$_name-git"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/variable/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
