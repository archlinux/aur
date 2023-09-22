# Maintainer: Stefan Schad <stefan+aur@finaloutpost.de>
# Contributor: Magnus Anderson <magnus@iastate.edu>
_download_file=Easy-Diffusion-Linux
_unzipped_dir=easy-diffusion

pkgname=stable-diffusion-ui
# pkgver=2.5.24
pkgver=3.0.2
pkgrel=1
pkgdesc='Easy Diffusion - A 1-click way to install & use Stable Diffusion on your own computer.'
arch=('x86_64')
url='https://stable-diffusion-ui.github.io/'
source=("https://github.com/easydiffusion/easydiffusion/releases/download/v3.0.2/Easy-Diffusion-Linux.zip")
#source=("https://github.com/cmdr2/stable-diffusion-ui/releases/latest/download/$_download_file.zip")
license=('custom')
provides=('stable-diffusion-ui')
makedepends=()
#md5sums=('SKIP')
sha512sums=('d073deda7c3dd4494be0678f0939e29578a7037525cfe14165ca0959154fe530014083b8875a692fed9ae5e1b3a12668e8a6d50765553d6debbc62d039a84f01')
install='stable-diffusion-ui.install'

build() {
	echo Do Androids Dream of Electric Sheep?
	cat >stable-diffusion-ui-server <<!
#!/bin/bash
cd /opt/stable-diffusion-ui
./start.sh
!
}

#pkgver() {
#	curl 'https://stable-diffusion-ui.github.io/docs/installation/' |
#		grep "$_download_file" |
#		awk -F \" '{print $2}' |
#		grep -oE '[0-9]+\.[0-9]+\.[0-9]+'
#}

package() {
	install -Dm644 "$_unzipped_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 stable-diffusion-ui-server "$pkgdir/usr/bin/stable-diffusion-ui-server"

	mkdir -p "$pkgdir/opt/"
	cp -r "$_unzipped_dir" "$pkgdir/opt/stable-diffusion-ui"
	chmod 777 -R "$pkgdir/opt/stable-diffusion-ui"
}
