# Maintainer: Stefan Schad <stefan+aur@finaloutpost.de>
# Contributor: Magnus Anderson <magnus@iastate.edu>
_download_file=Easy-Diffusion-Linux
_unzipped_dir=easy-diffusion

pkgname=stable-diffusion-ui
# pkgver=2.5.24
pkgver=3.0.2
pkgrel=3
pkgdesc='Easy Diffusion - A 1-click way to install & use Stable Diffusion on your own computer.'
arch=('x86_64')
url='https://stable-diffusion-ui.github.io/'
source=("${pkgname}-${pkgver}.zip::https://github.com/easydiffusion/easydiffusion/releases/download/v${pkgver}/Easy-Diffusion-Linux.zip")
license=('custom')
provides=('stable-diffusion-ui')
depends=('curl' 'tar' 'bzip2' 'git')
makedepends=()
sha512sums=('d073deda7c3dd4494be0678f0939e29578a7037525cfe14165ca0959154fe530014083b8875a692fed9ae5e1b3a12668e8a6d50765553d6debbc62d039a84f01')
install='stable-diffusion-ui.install'

build() {
	echo Do Androids Dream of Electric Sheep?
	cat >stable-diffusion-ui-server <<!
#!/bin/bash
# Check git status
if [ -d "/opt/stable-diffusion-ui/sd-ui-files" ]; then
  cd /opt/stable-diffusion-ui/sd-ui-files
  if git status; then
      echo sd_ui_git_cloned > /opt/stable-diffusion-ui/scripts/install_status.txt
  fi
fi
# Start server
cd /opt/stable-diffusion-ui
./start.sh
!
}

package() {
	install -Dm644 "$_unzipped_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 stable-diffusion-ui-server "$pkgdir/usr/bin/stable-diffusion-ui-server"

	mkdir -p "$pkgdir/opt/"
	cp -r "$_unzipped_dir" "$pkgdir/opt/stable-diffusion-ui"
	chmod 777 -R "$pkgdir/opt/stable-diffusion-ui"
}
