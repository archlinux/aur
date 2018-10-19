# Maintainer: Andreas Louv <andreas@louv.dk>

pkgname=rpglelint-git
pkgver=0.8.2
pkgrel=1
pkgdesc="Lint ILE/RPG programs"
arch=("any")
url="https://github.com/andlrc/rpglelint"
license=("PerlArtistic")
depends=("perl>=5.16" "perl-json")
makedepends=("git")
provides=("rpglelint")
source=('rpglelint::git+git://github.com/andlrc/rpglelint#branch=master')
md5sums=("SKIP")

pkgver()
{
	cd "$srcdir/${pkgname%-git}"
	sed '/our \$VERSION.*["'\'']\(.*\)["'\''].*/{s//\1/;q};d' rpglelint
}

package()
{
	cd "$srcdir/${pkgname%-git}"
	install -D rpglelint $pkgdir/usr/bin/rpglelint
	install -Dm644 rpglelint.1perl $pkgdir/usr/share/man/man1/rpglelint.1perl
	install -Dm644 RPG/Parser.pm $pkgdir/usr/share/perl5/vendor_perl/RPG/Parser.pm
	install -Dm644 RPG/Linter.pm $pkgdir/usr/share/perl5/vendor_perl/RPG/Linter.pm
	install -Dm644 RPG/Statement.pm $pkgdir/usr/share/perl5/vendor_perl/RPG/Statement.pm
	install -Dm644 RPG/Constant.pm $pkgdir/usr/share/perl5/vendor_perl/RPG/Constant.pm
}
