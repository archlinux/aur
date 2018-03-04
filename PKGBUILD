# $Id$
# Maintainer: Lars Norberg < arch-packages at cogwerkz dot org >
# Based on wine & wine-staging PKGBUILDs

pkgname=wine-staging-dev
pkgver=3.3.r0.ge09e1fd3+wine.3.3.r0.gf17120d11b
pkgrel=1
_winesrcdir='wine-git'
_ninesrcdir='wine-d3d9'
pkgdesc='Staging branch of wine, with various extra patches including gallium nine. Git versions.'
arch=('i686' 'x86_64')
url='https://github.com/wine-staging/wine-staging'
license=('LGPL')

_depends=(
    'attr'                  'lib32-attr'
    'fontconfig'            'lib32-fontconfig'
    'lcms2'                 'lib32-lcms2'
    'libxml2'               'lib32-libxml2'
    'libxcursor'            'lib32-libxcursor'
    'libxrandr'             'lib32-libxrandr'
    'libxdamage'            'lib32-libxdamage'
    'libxi'                 'lib32-libxi'
    'gettext'               'lib32-gettext'
    'freetype2'             'lib32-freetype2'
    'glu'                   'lib32-glu'
    'libsm'                 'lib32-libsm'
    'gcc-libs'              'lib32-gcc-libs'
    'libpcap'               'lib32-libpcap'
    'desktop-file-utils'
)
makedepends=(
	'git' 
	'autoconf' 
	'ncurses' 
	'bison' 
	'perl' 
	'fontforge' 
	'flex'
    'gcc>=4.5.0-2'
    'giflib'                'lib32-giflib'
    'libpng'                'lib32-libpng'
    'gnutls'                'lib32-gnutls'
    'libxinerama'           'lib32-libxinerama'
    'libxcomposite'         'lib32-libxcomposite'
    'libxmu'                'lib32-libxmu'
    'libxxf86vm'            'lib32-libxxf86vm'
    'libldap'               'lib32-libldap'
    'mpg123'                'lib32-mpg123'
    'openal'                'lib32-openal'
    'v4l-utils'             'lib32-v4l-utils'
    'alsa-lib'              'lib32-alsa-lib'
    'libxcomposite'         'lib32-libxcomposite'
    'mesa'                  'lib32-mesa'
    'libgl'                 'lib32-libgl'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'libxslt'               'lib32-libxslt'
    'libpulse'              'lib32-libpulse'
    'libva'                 'lib32-libva'
    'gtk3'                  'lib32-gtk3'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'samba'
    'opencl-headers'
)
optdepends=(
    'giflib'                'lib32-giflib'
    'libpng'                'lib32-libpng'
    'libldap'               'lib32-libldap'
    'gnutls'                'lib32-gnutls'
    'mpg123'                'lib32-mpg123'
    'openal'                'lib32-openal'
    'v4l-utils'             'lib32-v4l-utils'
    'libpulse'              'lib32-libpulse'
    'alsa-plugins'          'lib32-alsa-plugins'
    'alsa-lib'              'lib32-alsa-lib'
    'libjpeg-turbo'         'lib32-libjpeg-turbo'
    'libxcomposite'         'lib32-libxcomposite'
    'libxinerama'           'lib32-libxinerama'
    'ncurses'               'lib32-ncurses'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'libxslt'               'lib32-libxslt'
    'libtxc_dxtn'           'lib32-libtxc_dxtn'
    'libva'                 'lib32-libva'
    'gtk3'                  'lib32-gtk3'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
    'cups'
    'samba'
    'dosbox'
)
options=('staticlibs')
source=("$_winesrcdir"::'git://source.winehq.org/git/wine.git'
		"$_ninesrcdir"::'git+https://github.com/kytulendu/wine-d3d9-patches.git'
        "$pkgname"::'git+https://github.com/wine-staging/wine-staging.git'
		'harmony-fix.diff'
        '30-win32-aliases.conf'
		'wine-binfmt.conf')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
			'50ccb5bd2067e5d2739c5f7abcef11ef096aa246f5ceea11d2c3b508fc7f77a1'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
			'c589c1668851cf5973b8e76d9bd6ae3b9cb9e6524df5d9cb90af4ac20d61d152')
install=wine.install

if [ "$CARCH" = 'i686' ] 
then
    # strip lib32 etc. on i686
    _depends=("${_depends[@]/*32-*/}")
    makedepends=("${makedepends[@]/*32-*/}" "${_depends[@]}")
    optdepends=("${optdepends[@]/*32-*/}")
    provides=(
        "wine=$(        printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-git=$(    printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
        "wine-staging=$(printf '%s' "$pkgver" | sed 's/\+wine.*//')"
    )
    conflicts=(
		'wine' 
		'wine-gaming-nine' 
		'wine-git' 
		'wine-staging' 
		'wine-staging-git' 
		'wine-staging-lutris-git'
		'wine-staging-nine' 
	)
	replaces=('wine-staging-lutris-git')
else
	makedepends=("${makedepends[@]}" "${_depends[@]}")
	provides=(
		"wine=$(        printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
		"wine-git=$(    printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
		"bin32-wine=$(  printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
		"wine-wow64=$(  printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
		"wine-staging=$(printf '%s' "$pkgver" | sed 's/\+wine.*//')"
	)
	conflicts=(
		'bin32-wine' 
		'wine' 
		'wine-gaming-nine' 
		'wine-git' 
		'wine-staging' 
		'wine-staging-git' 
		'wine-staging-lutris-git'
		'wine-staging-nine' 
		'wine-wow64' 
	)
	replaces=('bin32-wine' 'wine-staging-lutris-git')
fi 

prepare() {
    cd "${_winesrcdir}"
    
    # restore the wine tree to its git origin state, without wine-staging patches
    # (necessary for reapllying wine-staging patches in succedent builds,
    # otherwise the patches will fail to be reapplied)
    msg2 'Cleaning wine source code tree...'
    git reset --hard HEAD      # restore tracked files
    git clean -xdf             # delete untracked files
    
    # change back to the wine upstream commit that this version of wine-staging is based in
    msg2 'Changing wine HEAD to the wine-staging base commit...'
    git checkout "$(../"$pkgname"/patches/patchinstall.sh --upstream-commit)"
	
	patch -Np1 < ../'harmony-fix.diff'

    # fix path of opencl headers
    sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*
}

pkgver() {
	# retrieve current staging version
    cd "$pkgname"
	#local _staging_version=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
	local _staging_tag="$(git tag --sort='version:refname' | tail -n1 | sed 's/-/./g;s/^v//;s/\.rc/rc/')"
	local _staging_version="$(git describe --long --tags \
								| sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.rc/rc/' \
								| sed "s/^latest.release/${_staging_tag}/")"

	# retrieve current wine development version
    cd "${srcdir}/${_winesrcdir}"
    local _wine_version="$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.rc/rc/')"
    
	printf '%s+%s' "$_staging_version" "$_wine_version"
}

build() {
    # delete old build dirs (from previous builds) and make new ones
    rm    -rf "$pkgname"-{32,64}-build
    mkdir -p  "$pkgname"-32-build
    
    # apply all wine-staging patches
    msg2 'Applying wine-staging patches...'
    ./"${pkgname}"/patches/patchinstall.sh DESTDIR="${srcdir}/${_winesrcdir}" --all
    
	# Apply nine patches
	patch -d "${srcdir}/${_winesrcdir}" -Np1 < $_ninesrcdir/staging-helper.patch
	patch -d "${srcdir}/${_winesrcdir}" -Np1 < $_ninesrcdir/wine-d3d9.patch

    # workaround for FS#55128
    # https://bugs.archlinux.org/task/55128
    # https://bugs.winehq.org/show_bug.cgi?id=43530
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    
    # build wine-staging 64-bit
    # (according to the wine wiki, this 64-bit/32-bit building order is mandatory)
    if [ "$CARCH" = "x86_64" ] 
    then
        msg2 'Building Wine-64...'
        mkdir -p "$pkgname"-64-build
        cd  "$pkgname"-64-build
        ../${_winesrcdir}/configure \
                        --prefix='/usr' \
                        --libdir='/usr/lib' \
                        --with-x \
                        --with-gstreamer \
						--with-d3d9-nine \
                        --enable-win64 \
                        --with-xattr \
			            --disable-tests

        make
        local _wine32opts=(
                    '--libdir=/usr/lib32'
                    "--with-wine64=${srcdir}/${pkgname}-64-build"
        )
        export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    fi
    
    # build wine-staging 32-bit
    msg2 'Building Wine-32...'
    cd "${srcdir}/${pkgname}"-32-build
    ../${_winesrcdir}/configure \
                    --prefix='/usr' \
                    --with-x \
                    --with-gstreamer \
					--with-d3d9-nine \
                    --with-xattr \
		            --disable-tests \
                    "${_wine32opts[@]}"
    make
}

package() {
    depends=("${_depends[@]}")
    
    # package wine-staging 32-bit
    # (according to the wine wiki, this reverse 32-bit/64-bit packaging order is important)
    msg2 'Packaging Wine-32...'
    cd "$pkgname"-32-build
    
    if [ "$CARCH" = 'i686' ] 
    then
        make prefix="${pkgdir}/usr" install
    else
        make prefix="${pkgdir}/usr" \
             libdir="${pkgdir}/usr/lib32" \
             dlldir="${pkgdir}/usr/lib32/wine" install
        
        # package wine-staging 64-bit
        msg2 'Packaging Wine-64...'
        cd "${srcdir}/${pkgname}"-64-build
        make prefix="${pkgdir}/usr" \
             libdir="${pkgdir}/usr/lib" \
             dlldir="${pkgdir}/usr/lib/wine" install
    fi
    
    # font aliasing settings for Win32 applications
    install -d "$pkgdir"/etc/fonts/conf.{avail,d}
    install -m644 "${srcdir}/30-win32-aliases.conf" "${pkgdir}/etc/fonts/conf.avail"
    ln -s ../conf.avail/30-win32-aliases.conf "${pkgdir}/etc/fonts/conf.d/30-win32-aliases.conf"
	install -Dm 644 "${srcdir}/wine-binfmt.conf" "${pkgdir}/usr/lib/binfmt.d/wine.conf"
}
