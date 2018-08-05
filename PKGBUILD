# Maintainer: Pierre Franco <pierre dot franco at ensimag dot grenoble dash inp dot fr>
# Based on wine-staging PKGBUILD

#Additional patches:
# - Gallium Nine support
# - Keybind patch reversion
# - Wbemprox videocontroller query fix v2 (see https://bugs.winehq.org/show_bug.cgi?id=38879 )
# - Steam patch, Crossover Hack version (see https://bugs.winehq.org/show_bug.cgi?id=39403 )
# - Linked lists perfomances improvements
# - Wine-PBA (disabled by default)
# - Fix for Path of Exile
# - Hack for F4SE and SKSE

pkgname=wine-gaming-nine
pkgver=3.13
pkgrel=2

_pkgbasever=${pkgver/rc/-rc}

_stagingversion="3.13.1"
_d3d9version="3.13"
_f4sehashrevision="b13af93bc951257d3d78bcc63e9894680f669913"

_stagingdir="wine-staging-wine-staging-pba-v$_stagingversion"
_d3d9dir="wine-d3d9-patches-wine-d3d9-$_d3d9version"
_f4sehackdir="wine-hackery-$_f4sehashrevision/f4se"

source=(
	https://dl.winehq.org/wine/source/3.x/wine-$_pkgbasever.tar.xz
	https://github.com/Firerat/wine-staging/archive/wine-staging-pba-v$_stagingversion.tar.gz
	https://github.com/sarnex/wine-d3d9-patches/archive/wine-d3d9-$_d3d9version.tar.gz
	https://github.com/hdmap/wine-hackery/archive/$_f4sehashrevision.tar.gz
	harmony-fix.patch
	30-win32-aliases.conf
	wine-binfmt.conf
	keybindings.patch
	poe-fix.patch
	steam.patch
	wbemprox_query_v2.patch
	wine-list.h-linked-list-cache-line-prefetching.patch
)
sha512sums=(
	'a07a3d2a19261f9251f165ca4c14871e6ebda4d3f99da16f9fc41f06e80cae3fb50aeab96628c7a739e635e896dbb31c55df8b42c4637a058f9035c664c93a59'
	'f5d72d0febbcb5468a717a4448b961708314ebdd2e2d088329849d5e3e9493e12f6736c11c33d185988dcbffe0c09b84e5fb28a35a8b248fc057a35789004176'
	'c3da30c0ce7fca433a703e42213c4a4f6c7a1f8a2d7744555a385641e5c344772dfd142779978d131bf42e79cddb4925b9926fd96e7e1497e173a755f1ec6ce5'
	'cb3e8d6e448388afc828ddea2eda937fa95707c10c28da70eb4b31ec99473b13154a4e5545c0809719617da051d41bbe8af41bef175a1f839ac0b956b5e61a38'
	'b86edf07bfc560f403fdfd5a71f97930ee2a4c3f76c92cc1a0dbb2e107be9db3bed3a727a0430d8a049583c63dd11f5d4567fb7aa69b193997c6da241acc4f2e'
	'6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
	'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285'
	'88a017239dd9a58735795e41a12a3480afe260d9747ab2997db26196bdb551cb7e7591596278a8c67c35343bd9f8bf0560f88d3dd10bfd65681f9d2c6c287c84'
	'7d2bb6d6be62405111e7a573471edb3d8114b12844cdd2581af1a6c87940cf62104156d9c80090fb980f9009a0903d25fbe3cdb9a7efbe81c0ad64fe24937112'
	'ca24cc86a74cc8af8e23a34da9231778f56a7e2cff215bb956898d73f6945410f0eaabae542a5fd68f83456fb8f56b60e0abe2a710f6b190a01f84817ab3676c'
	'904a6d5578c75633f9c8293a939d4ff67627b85b0ffcc9b6c2af5280314c7670d52c1c0c441bb6231508337a12e72abb620ca5ac5da5d45ffaa8f25fdddbb43d'
	'abeef97c54f3dbdb49b737a5966c8a435c9235a4c2c6da151503ea1c14fa1889a8f35a5f80daa6188d367298716f8a64db4714d19be5e1203dc43239431f7ed2'
)

pkgdesc="Based off wine-staging, including the gallium-nine patches and some more hacks"
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)

depends=(
  fontconfig      lib32-fontconfig
  lcms2           lib32-lcms2
  libxml2         lib32-libxml2
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libxi           lib32-libxi
  gettext         lib32-gettext
  freetype2       lib32-freetype2
  glu             lib32-glu
  libsm           lib32-libsm
  gcc-libs        lib32-gcc-libs
  libpcap         lib32-libpcap
  desktop-file-utils
)
makedepends=(autoconf ncurses bison perl fontforge flex
  'gcc>=4.5.0-2'
  giflib                lib32-giflib
  libpng                lib32-libpng
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxmu                lib32-libxmu
  libxxf86vm            lib32-libxxf86vm
  libldap               lib32-libldap
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  libgl                 lib32-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  gtk3                  lib32-gtk3
  vulkan-icd-loader     lib32-vulkan-icd-loader
  samba
  opencl-headers
  xorgproto
  pkg-config
)
optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  cups
  samba                 dosbox
)
provides=("wine=$pkgver" "wine-wow64=$pkgver" "wine-staging=$pkgver")
conflicts=('wine' 'wine-wow64' 'wine-staging')
makedepends=(${makedepends[@]} ${depends[@]})
install=wine.install

_f4sehackprepare() {
  for _f in $_f4sehackdir/*.patch; do
    patch -d $pkgname -Np1 < $_f
  done
}

prepare() {
  # Allow ccache to work
  mv wine-$_pkgbasever $pkgname

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  patch -d $pkgname -Np1 < harmony-fix.patch

  patch -d $pkgname -Np1 < poe-fix.patch
  patch -d $pkgname -Np1 < steam.patch
  patch -d $pkgname -Np1 < wine-list.h-linked-list-cache-line-prefetching.patch
  patch -d $pkgname -Np1 < wbemprox_query_v2.patch

  patch -d $pkgname -Np1 -R < keybindings.patch

  $_stagingdir/patches/patchinstall.sh DESTDIR=$pkgname --all -W wined3d-Persistent_Buffer_Allocator

  patch -d $pkgname -Np1 < $_d3d9dir/staging-helper.patch
  patch -d $pkgname -Np1 < $_d3d9dir/wine-d3d9.patch

  _f4sehackprepare

  autoreconf -f "$pkgname"

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i $pkgname/configure*

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-32-build
}

build() {
  cd "$srcdir"

  msg2 "Building Wine-64..."

  mkdir $pkgname-64-build
  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --with-gstreamer \
    --enable-win64 \
    --disable-tests \
    --with-d3d9-nine

  make

  _wine32opts=(
    --libdir=/usr/lib32
    --with-wine64="$srcdir/$pkgname-64-build"
  )

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  msg2 "Building Wine-32..."
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --with-x \
    --with-gstreamer \
    --disable-tests \
    --with-d3d9-nine \
    "${_wine32opts[@]}"

  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib32" \
    dlldir="$pkgdir/usr/lib32/wine" install

  msg2 "Packaging Wine-64..."
  cd "$srcdir/$pkgname-64-build"
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
  install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
