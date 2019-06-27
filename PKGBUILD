# Contributor: Drew Liszewski <drew dot liszewski at gmail dot com>
# Maintainer: Christopher KOBAYASHI <software plus aur at disavowed dot jp>
pkgname=emulationstation-themes
pkgver=0.2
pkgrel=1
pkgdesc="EmulationStation themes pack"
arch=('any')
url="http://aloshi.com/emulationstation"
license=('WTFPL')
groups=()
makedepends=('git')
depends=()
install='emulationstation-themes.install'
source=('https://aloshi.com/es_downloads/es_themes_jan_20_2013.zip'
        'https://emulationstation.org/downloads/themes/simple_latest.zip'
	'git+https://github.com/RetroPie/es-theme-carbon-centered.git'
	'git+https://github.com/RetroPie/es-theme-carbon-nometa.git'
	'git+https://github.com/RetroPie/es-theme-clean-look.git'
	'git+https://github.com/RetroPie/es-theme-color-pi.git'
	'git+https://github.com/RetroPie/es-theme-simple-dark.git'
	'git+https://github.com/RetroPie/es-theme-simplified-static-canela.git'
	'git+https://github.com/RetroPie/es-theme-turtle-pi.git'
       )
noextract=('es_themes_jan_20_2013.zip')
sha256sums=('f6430cf382cbd9dbd17ef864ae47993d5c912c6a0023f8189d98809aebe49b79'
	    '567cc78d4aec1ef13893834c7e73c3eea91f50d096468c1ae40c973c502471ea'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	   )

prepare() {
    mkdir -p xevin
    bsdtar -xf es_themes_jan_20_2013.zip -C xevin/
}

build() {
    rm -r -f ${srcdir}/*/.git*
}

package() {
    cd "${srcdir}"
    install -d ${pkgdir}/usr/share/EmulationStation/themes
    cp -r ${srcdir}/{simple,xevin} ${pkgdir}/usr/share/EmulationStation/themes/
    for i in carbon-centered carbon-nometa clean-look color-pi simple-dark \
	simplified-static-canela turtle-pi; do
	    cp -r ${srcdir}/es-theme-${i} \
		${pkgdir}/usr/share/EmulationStation/themes/${i}
    done
}
