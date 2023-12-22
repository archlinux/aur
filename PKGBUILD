# Maintainer: hzmi <contact at hzmi.xyz>
# Contributor: Gabriel Guldner <gabriel at guldner.eu>
_pkgname=git-credential-manager-core
pkgname=git-credential-manager-core-bin
pkgver=2.4.1
pkgrel=2
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
		'https://raw.githubusercontent.com/git-ecosystem/git-credential-manager/main/LICENSE')
noextract=("gcm-linux_amd64.$pkgver.tar.gz")
sha256sums=('42637d3d497f1ea066256fbfca9848711edc3a90063b47e248f9cd6d134d652c'
            '32f49d3f3bf9835546b1335543107eb668fb2276017cf30a8c125f999bb3f00d'
            'b47f1a8a744ecdc7a3da35804f88552805d33f51a726b87a2105acdfae406b07')

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
