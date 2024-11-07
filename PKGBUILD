# Maintainer: FerrousInk <ferrousink-aur@proton.me>

pkgname=ttf-windows-fonts
pkgver=1.0.0
pkgrel=1
pkgdesc="All of the fonts needed for proper Microsoft services with automated installation"
arch=('any')
source=(fonts.iso::http://software-static.download.prss.microsoft.com/pr/download/19042.631.201119-0144.20h2_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso)
sha256sums=('SKIP')
depends=('wimlib' 'sudo')

prepare() {
    mkdir wim-mount
    mkdir fonts
    mkdir iso-mount

    sudo mount fonts.iso iso-mount
    cp iso-mount/sources/install.wim ./fonts.wim
    sudo umount iso-mount

    wimlib-imagex mount fonts.wim wim-mount
    cp wim-mount/Windows/Fonts/*.ttf fonts
    wimlib-imagex unmount wim-mount

    sudo cp -r fonts /usr/share/fonts/TTF
}