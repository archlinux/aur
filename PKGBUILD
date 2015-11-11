# Maintainer: Vincent Debarre <vinilox@vinilox.eu>

pkgname=battlejump
pkgver=0.12.0
pkgrel=9
pkgdesc="Arcade game inspired by Monster Farm Jump."
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x64
arch=('i686' 'x86_64')
url="http://www.battlejump.com" 
license="cc-by-nc-sa"
depends=('sdl' 'sdl_mixer' 'sdl_image' 'sdl_ttf' 'curl' 'java-runtime')
source=(http://www.battlejump.com/Download/Battle_Jump_v0122_Linux_${ARCH}.tar.gz battlejumplauncher.desktop battlejump.desktop)
md5sums=(264e973bf5ca043c83ecb85dab5b1386 b15ded254e76fde81cfafbae97da812a e27233098a9d454adf2eae4767cfb076)
[ "$CARCH" = "x86_64" ]  && md5sums=(4c8c3b0dab9d9b9295b5134dc2c79944 b15ded254e76fde81cfafbae97da812a e27233098a9d454adf2eae4767cfb076)


build() { 
	cd ${srcdir}/Battle*
        mkdir -p ${pkgdir}/usr/bin
        mkdir -p ${pkgdir}/usr/share/{battlejump,applications}
        cp -R * ${pkgdir}/usr/share/battlejump 
	chmod 755 -R ${pkgdir}/usr/share/battlejump
	echo "cd '/usr/share/battlejump/' && ./BattleJumpLauncher" > ${pkgdir}/usr/bin/battlejumplauncher
	echo "cd '/usr/share/battlejump/' && ./BattleEditor" > ${pkgdir}/usr/bin/battlejumpeditor
	echo "cd '/usr/share/battlejump/' && ./BattleJump" > ${pkgdir}/usr/bin/battlejump
	echo "cd '/usr/share/battlejump/' && ./BattleJumpLevelManager" > ${pkgdir}/usr/bin/battlejumplevelmanager
	chmod +x ${pkgdir}/usr/bin/*
        chmod 777 ${pkgdir}/usr/share/battlejump/Data/*dat
        install ${srcdir}/*.desktop ${pkgdir}/usr/share/applications

}

