# Maintainer: N.E. Neal <contact at [part of name before neal without dots] dog com>
pkgname=enhanceddiscord-git
pkgver=r149.c1cd97d
pkgrel=1
epoch=
pkgdesc="EnhancedDiscord is a modification for the Discord desktop app that allows you to load themes and plugins easily, quickly, and safely. "
arch=('any')
url="https://github.com/joe27g/EnhancedDiscord"
license=('unknown')
groups=()
depends=('discord')
makedepends=('git')
checkdepends=()
optdepends=()  
provides=()    
conflicts=() 
replaces=()
backup=()   
options=() 
install=
changelog=  
source=("EnhancedDiscord::git+git://github.com/joe27g/EnhancedDiscord.git")
noextract=()
md5sums=(SKIP)                                              
validpgpkeys=()


pkgver() {
	cd $startdir/EnhancedDiscord
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mv ${srcdir}/EnhancedDiscord ~/.local/share
	cd ~/.local/share/EnhancedDiscord
	injdir=$(pwd)
}

package() {
	# custom var needed for a hacky solution, because discord reads index.js strangely
	cd ~/.local/share/EnhancedDiscord
	injdir=$(pwd)
	
	# continue as normal
	cd ~/.config/discord*/0.*/modules/discord_desktop_core/
	echo "require('${injdir}/injection.js');" | cat - index.js > temp && mv temp index.js
	echo "process.env.injDir = '${injdir}';" | cat - index.js > temp && mv temp index.js
	echo '{}' >> ~/.local/share/EnhancedDiscord/config.json
}

