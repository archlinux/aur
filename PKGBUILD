# Maintainer: Gabriel Guldner <gabriel at guldner.eu>
pkgname=git-credential-manager-core-bin
_pkgname=git-credential-manager-core
pkgver=2.0.632
# _pkgver=2.0.452
_build=34631
pkgrel=2
pkgdesc="Secure, cross-platform Git credential storage with authentication to GitHub, Azure Repos, and other popular Git hosting services."
arch=('x86_64')
url="https://github.com/microsoft/Git-Credential-Manager-Core"
license=('MIT')
depends=('zlib' 'krb5')
optdepends=('kwallet: For storing credentials' 
			'gnome-keyring: For storing credentials' 
			'gnupg: For storing credentials in a gpg file'
			'pass: For storing credentials in a gpg file' )
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
changelog=
options=('!strip')
source=("https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v$pkgver/gcmcore-linux_amd64.$pkgver.$_build.tar.gz"
		"$_pkgname.install"
		'LICENSE')
noextract=("gcmcore-linux_amd64.$pkgver.$_build.tar.gz")
sha256sums=('8005d48b47d9b20bb45e18bba4060af11ecb8a53865a45b282894849a93e6cc4'
            '399aa9e3cf7a30c3658129564f9aa14871de61aed9a1b429ecc4f96a92a69400'
            '30147347d5ce41662672ea2be7b158ae0e014398b97a148dd07bfd46c5166292')

prepare() {
    cd "$srcdir"
    mkdir -p gcm
    bsdtar xvf "gcmcore-linux_amd64.$pkgver.$_build.tar.gz" -C gcm
}

package() {
	cd "$srcdir"
    install -Dm644 -o0 -g0 LICENSE "$pkgdir/usr/share/licenses/git-credential-manager-core-bin/LICENSE"

    mkdir -p "$pkgdir/usr/bin/"
    ln -s ../share/git-credential-manager-core/git-credential-manager-core "$pkgdir/usr/bin/git-credential-manager-core"

    cd gcm
    find -type f -exec install -Dm755 -o0 -g0 "{}" "$pkgdir/usr/share/git-credential-manager-core/{}" \;
}
