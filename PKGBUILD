# Maintainer: HRKings <hrkings@***.com>
pkgname=gitgudcli-git
_pkgname=GitGudCLI
pkgver=1.1.0
pkgrel=1
pkgdesc="An easy to use CLI for the GitGud modular Git model."
arch=(any)
url="https://github.com/HRKings/GitGudCLI.git"
license=('unknown')
makedepends=('git' 'dotnet-sdk')
provides=(gitgudcli)
source=("git+${url}")
md5sums=('SKIP')
options=(!strip)

package() {
	cd ${_pkgname}

	# Move to the stable branch
	git checkout stable

	# Install the README
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Cd into project
	cd ${_pkgname}

	# Compile with all the flags
	dotnet publish -c Release -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:PublishReadyToRun=true -o ./compiled

	# Install the CLI
  	install -Dm755 ./compiled/GitGudCLI "${pkgdir}"/usr/bin/gitgud
}