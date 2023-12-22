# Maintainer: Gabriel Guldner <gabriel at guldner.eu>
_pkgname=git-credential-manager-core
pkgname=git-credential-manager-core-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Secure, cross-platform Git credential storage with authentication to GitHub, Azure Repos, and other popular Git hosting services."
arch=('x86_64')
url="https://github.com/git-ecosystem/git-credential-manager"
license=('MIT')
depends=('zlib' 'krb5' 'fontconfig')
optdepends=('kwallet: For storing credentials' 
			'gnome-keyring: For storing credentials' 
			'gnupg: For storing credentials in a gpg file'
			'pass: For storing credentials in a gpg file' )
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
changelog=
options=('!strip')
source=("https://github.com/git-ecosystem/git-credential-manager/releases/download/v$pkgver/gcm-linux_amd64.$pkgver.tar.gz"
		"$_pkgname.install"
		'LICENSE')
noextract=("gcm-linux_amd64.$pkgver.tar.gz")
sha256sums=('42637d3d497f1ea066256fbfca9848711edc3a90063b47e248f9cd6d134d652c'
            '7df213d44ac22f9d2832f0a91820ceb37bc965697c6cfe53b4dd160e56d7ca62'
            '30147347d5ce41662672ea2be7b158ae0e014398b97a148dd07bfd46c5166292')

prepare() {
	cd "$srcdir"
	mkdir -p gcm
	bsdtar xvf "gcm-linux_amd64.$pkgver.tar.gz" -C gcm
}

package() {
	cd "$srcdir"
	install -Dm644 -o0 -g0 LICENSE "$pkgdir/usr/share/licenses/git-credential-manager-core-bin/LICENSE"

	mkdir -p "$pkgdir/usr/bin/"
	ln -s ../share/git-credential-manager-core/git-credential-manager "$pkgdir/usr/bin/git-credential-manager"
	ln -s ../share/git-credential-manager-core/git-credential-manager "$pkgdir/usr/bin/git-credential-manager-core"

	cd gcm
	find -type f -exec install -Dm755 -o0 -g0 "{}" "$pkgdir/usr/share/git-credential-manager-core/{}" \;
}
