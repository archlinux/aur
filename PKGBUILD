# Maintainer: Gabriel B. Sant'Anna <baiocchi.gabriel@gmail.com>

# overall information
pkgname=akku
pkgdesc="Language package manager for Scheme"
url="https://akkuscm.org/"
license=('GPL3')
arch=('any')

# version-specific information
pkgrel=4
pkgver=1.1.0

# dependencies are stated in https://gitlab.com/akkuscm/akku/-/blob/master/README.md
depends=('git' 'curl' 'guile>=2.2')
makedepends=('pkg-config' 'make')

# source URLs for latest versions can be found at https://gitlab.com/akkuscm/akku/-/releases
options=(!strip) # disable stripping
source=("https://gitlab.com/akkuscm/akku/uploads/819fd1f988c6af5e7df0dfa70aa3d3fe/akku-1.1.0.tar.gz"
        "https://gitlab.com/akkuscm/akku/uploads/7650c7563078baba3d835282765c43cb/akku-1.1.0.tar.gz.sig")
noextract=('$pkgname-$pkgver.tar.gz.sig')

# full fingerprint from the output of gpg --list-keys --fingerprint E33E61A2E9B8C3A2
# which is the key found in https://gitlab.com/akkuscm/akku/-/blob/master/README.md
# in the case of ... (unknown public key KEY_ID) ==> ERROR: One or more PGP signatures could not be verified!
# one must add the key to the user keyring with gpg --recv-key KEY_ID
validpgpkeys=('08272FBB54EEB5072D5BA930E33E61A2E9B8C3A2') # Göran Weinholt

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# md5sums generated with updpkgsums
md5sums=('09916b7e1c51d7f762ef6385934f96eb'
         'SKIP')
