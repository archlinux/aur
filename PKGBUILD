# Maintainer: hzmi <contact at hzmi.xyz>
# Contributor: Gabriel Guldner <gabriel at guldner.eu>
_pkgname=git-credential-manager
pkgname=git-credential-manager-bin
pkgver=2.7.3
pkgrel=1
pkgdesc="Secure, cross-platform Git credential storage with authentication to GitHub, Azure Repos, and other popular Git hosting services."
arch=('x86_64')
url="https://github.com/git-ecosystem/git-credential-manager"
license=('MIT')
depends=('fontconfig' 'git' 'icu' 'krb5' 'zlib')
optdepends=('org.freedesktop.secrets: For storing credentials using freedesktop.org Secret Service API (libsecret)'
		'pass: For storing credentials using gpg via pass' )
provides=($_pkgname)
conflicts=($_pkgname)
replaces=(git-credential-manager-core-bin)
install=$_pkgname.install
changelog=
options=('!strip')
source=("https://github.com/git-ecosystem/git-credential-manager/releases/download/v$pkgver/gcm-linux-x64-$pkgver.tar.gz"
		"$_pkgname.install"
		'https://raw.githubusercontent.com/git-ecosystem/git-credential-manager/main/LICENSE')
noextract=("gcm-linux-x64-$pkgver.tar.gz")
sha256sums=('c7935c3e1b22681d56011b580086aeb6d60f3f0aaf6ef9c581480356988ff804'
            '9c4dd73ab2e074a4fb828299c32600dd9409a873e064a1208567070dcc41a899'
            'b47f1a8a744ecdc7a3da35804f88552805d33f51a726b87a2105acdfae406b07')

prepare() {
	cd "$srcdir"
       bsdtar xvf "gcm-linux-x64-$pkgver.tar.gz"
}

package() {
	cd "$srcdir"

	mkdir -pv "$pkgdir/usr/bin"
	mkdir -pv "$pkgdir/usr/lib/share/$pkgname"
	mkdir -pv "$pkgdir/usr/share/licenses/$pkgname"

	find \( -name LICENSE -o -name NOTICE \) -exec install -Dm644 -o0 -g0 "{}" "$pkgdir/usr/share/licenses/$pkgname/{}" \;
	find -type f -not -name "NOTICE" -exec install -Dm755 -o0 -g0 "{}" "$pkgdir/usr/lib/share/$pkgname/{}" \;

	ln -s "../lib/share/$pkgname/git-credential-manager" "$pkgdir/usr/bin/git-credential-manager"
}
