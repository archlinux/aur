# Maintainer: Mateusz Paluszkiewicz <aifam96@gmail.com>

pkgname=code
pkgver=1.4.0
pkgrel=2
pkgdesc="Code editing. Redefined. Visual Studio Code."
arch=('i686' 'x86_64')
url="https://code.visualstudio.com/"
license=('MIT')
depends=('gconf' 'gtk2' 'libnotify' 'nss')
provides=('vscode' 'visualstudiocode' 'visual-studio-code')
conflicts=('visual-studio-code' 'visual-studio-code-oss' 'visual-studio-code-git')
replaces=('visual-studio-code')

_version=6276dcb0ae497766056b4c09ea75be1d76a8b679
source_x86_64=("https://az764295.vo.msecnd.net/stable/${_version}/VSCode-linux-x64-stable.zip"
"code.desktop")
source_i686=("https://az764295.vo.msecnd.net/stable/${_version}/VSCode-linux-ia32-stable.zip"
"code.desktop")
md5sums_x86_64=('86881a676f8b582886618933d5b55267'
'd21422a3633592bac7b22aa7d891d9f2')
md5sums_i686=('acba124c25d7ca9356824ee416e72688'
'd21422a3633592bac7b22aa7d891d9f2')

package() {
	_pkg=VSCode-linux-x64
	if [ "${CARCH}" = "i686" ]; then
		_pkg=VSCode-linux-ia32
	fi

	# Creating directories
	install -dm755 "$pkgdir"/{,usr/{bin,share/{pixmaps,applications,licenses/$pkgname}}}

	# Read Write for all users and groups, that repairs problems with icon extension
	install -dm777 "$pkgdir"/usr/share/$pkgname

	# Installing launcher
	install -m644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/

	# Copying all files
	cp -a "$srcdir"/$_pkg/* "$pkgdir"/usr/share/$pkgname/
	chmod -R 777 "$pkgdir"/usr/share/$pkgname/

 	# Installing icons
	install -m644 "$srcdir"/$_pkg/resources/app/resources/linux/code.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

	# Installing license
	install -m644 "$srcdir"/$_pkg/resources/app/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/

	# Link binary to /usr/bin
	ln -s /usr/share/$pkgname/code "$pkgdir"/usr/bin/code
}
