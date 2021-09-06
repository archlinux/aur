# Maintainer: Amelia (AmeliaYeah@aur.archlinux.org)
pkgname='ctf-recon-utils'
pkgver=1.0
pkgrel=1
pkgdesc="Some scripts that make CTF Reconnaisance alot more straightforward."
arch=('x86_64')
url="https://github.com/AmeliaYeah/ctf-recon-utils"
license=('GPL')
depends=('ffuf' 'gobuster' 'nikto' 'curl' 'nmap' 'git' 'python3' 'python-pip')
optdepends=('libnotify')

prepare() {
	echo "Cloning github repository..."
	git clone "$url" "$srcdir/ctf-recon"
}

package() {
	echo "Making the package directories..."
	mkdir -p "$pkgdir/usr"

	echo "Setting the base directory for the installation script..."
	base_dir="$pkgdir"
	export base_dir

	echo "Moving into the cloned repository..."
	git_repo="$srcdir/ctf-recon"
	cd "$git_repo"

	echo "Running the install script..."
	chmod +x ./install.sh
	./install.sh

	echo "Cleaning out the repository..."
	cd "$srcdir"
	rm -rf "$git_repo"
}
