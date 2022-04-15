# Maintainer: Gabriel Guldner <gabriel at guldner.eu>
pkgname=git-credential-manager-core-bin
_pkgname=git-credential-manager-core
pkgver=2.0.696
# _pkgver=2.0.452
_build=34631
pkgrel=1
pkgdesc="Secure, cross-platform Git credential storage with authentication to GitHub, Azure Repos, and other popular Git hosting services."
arch=('x86_64')
url="https://github.com/GitCredentialManager/git-credential-manager"
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
source=("https://github.com/GitCredentialManager/git-credential-manager/releases/download/v$pkgver/gcmcore-linux_amd64.$pkgver.tar.gz"
		"$_pkgname.install"
		'LICENSE')
noextract=("gcmcore-linux_amd64.$pkgver.$_build.tar.gz")
sha256sums=('2927962d33d69607d07000a0e71ff6f344e4f0195a7ed285e9b7b5104f6c2d65'
            '6898b6748fc03351f27c23d3a1969f609ed781e07702e6c34415599e602b1210'
            '30147347d5ce41662672ea2be7b158ae0e014398b97a148dd07bfd46c5166292')

prepare() {
    cd "$srcdir"
    mkdir -p gcm
    bsdtar xvf "gcmcore-linux_amd64.$pkgver.tar.gz" -C gcm
}

package() {
	cd "$srcdir"
    install -Dm644 -o0 -g0 LICENSE "$pkgdir/usr/share/licenses/git-credential-manager-core-bin/LICENSE"

    mkdir -p "$pkgdir/usr/bin/"
    ln -s ../share/git-credential-manager-core/git-credential-manager-core "$pkgdir/usr/bin/git-credential-manager-core"

    cd gcm
    find -type f -exec install -Dm755 -o0 -g0 "{}" "$pkgdir/usr/share/git-credential-manager-core/{}" \;
}
