# Maintainer: Patrick Rogers <patrick@thewebzone.net>
pkgname='linux-air-combat'
pkgver=08p83
pkgrel=1
pkgdesc="Free open source combat flight simulator"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://askmisterwizard.com/2019/LinuxAirCombat/IntroducingLinuxAirCombat.htm"
license=('unknown')
depends=('freeglut' 'sdl' 'sdl_mixer' 'glu' 'mesa')
makedepends=('gcc')
optdepends=('espeak: adds voice effects in-game'
	    'mumble: team voice integration')
source=("https://sourceforge.net/projects/linuxaircombat/files/Choose%20Your%20Platform/Most%20LINUX%20Desktops%20%28in%20the%20global%20usr%20filesystem%20for%20all%20users%29/Lac${pkgver}.tar.gz")
md5sums=('SKIP')
_resource_dir='/usr/share/lac'
_filename='Lac${pkgver}'

build() {
    cd "Lac${pkgver}"
    make
}

package() {
    cd "Lac${pkgver}"
    RESOURCE_DIR=/usr/share/lac
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/${_resource_dir}"
    mkdir -p "$pkgdir/${_resource_dir}/music"
    mkdir -p "$pkgdir/${_resource_dir}/sounds"
    mkdir -p "$pkgdir/${_resource_dir}/models"
    mkdir -p "$pkgdir/${_resource_dir}/textures"
    mkdir -p "$pkgdir/usr/share/applications"
    # Copying main executable file...
    cp bin/Release/Lac${pkgver} $pkgdir/usr/bin/
    mv $pkgdir/usr/bin/Lac${pkgver} $pkgdir/usr/bin/lac
    chmod +x $pkgdir/usr/bin/lac

    cp lac.png $pkgdir/$_resource_dir/.
    chmod +r $pkgdir/$_resource_dir/lac.png 

    cp DefaultHeightMap.LAC $pkgdir/$_resource_dir/DefaultHeightMap.LAC
    chmod +r $pkgdir/$_resource_dir/DefaultHeightMap.LAC
    
    cp bin/music/* $pkgdir/${_resource_dir}/music
    chmod +r $pkgdir/${_resource_dir}/music/*
    
    cp bin/sounds/* $pkgdir/${_resource_dir}/sounds
    chmod +r $pkgdir/${_resource_dir}/sounds/*
    
    cp bin/models/* $pkgdir/${_resource_dir}/models
    chmod +r $pkgdir/${_resource_dir}/models/*
    
    cp bin/textures/* $pkgdir/${_resource_dir}/textures
    chmod +r $pkgdir/${_resource_dir}/textures/*
    
    cp lac.desktop $pkgdir/usr/share/applications/
    chmod +r $pkgdir/usr/share/applications/lac.desktop
}
