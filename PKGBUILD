# Maintainer: Will Elliott <will@gill>

pkgname=fvwm-patched
_pkgname=fvwm
pkgver=2.6.9
pkgrel=2
pkgdesc="A multiple large virtual desktop window manager originally derived from twm with patches"
arch=('x86_64')
url="https://github.com/willscreel/fvwm-patched"
license=('GPL' 'custom')
depends=('fribidi' 'perl' 'libstroke' 'libxpm' 'librsvg' 'libxinerama' 'libxcursor' 'python-xdg')
makedepends=('libxslt')
optdepends=('perl-tk: for ClickToFocus support'
            'perl-x11-protocol: for ClickToFocus support')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=('!emptydirs' '!makeflags')
source=(https://github.com/fvwmorg/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz
            fvwm.desktop
            01-TranslucentMenus.patch
            02-ColourBorders.patch
            03-ResizeOutlineThin.patch
            04-Conditionals.patch
            05-FlatSeparators.patch
            06-BorderUnderTitle.patch
            07-InactiveFont.patch
            08-FluxRoundedCorners.patch
            09-TopBorder.patch
            10-ButtonWidth.patch
            11-MultiBorder.patch
            12-FvwmButtonsTips.patch
            13-FvwmIconMan.patch
            14-Hover.patch
            15-FirstItemUnderPointer.patch
            16-ThinGeometryProxy.patch
	    17-MiniIconSize.patch)
sha256sums=('1bc64cf3ccd0073008758168327a8265b8059def9b239b451d6b9fab2cc391ae'
            '51d345f995f57c6d881d48bf535f71d75041a9bf1f0fa41dd99e1b22fd66aaf3'
            '08d7fef7d0f3216b39f41932705ea68c0d255a0c2a1138bf4614070c7250a4a7'
            '749c536ff838e528f1e9345f18ca3948559cc788bdeb49f03c9676756576fc62'
            'fe235e46d24a33ea7c1b6ba0753f93c5733d6e5de29e5efae71ba7bdbe49f9ac'
            '0d202215543f52b4b3249ac7f0117ca8abba35e913c45cb9173dfc10fe8746a7'
            'b3eedf33687f3b76cc3940867af8068285226a9b8f83dbde1152ee7b72dac446'
            '2fdf0723b790890a1740e7bd2e1d064dda4e468661fcabd659a374613ea84b46'
            '15d197d8fb630725a65dd9007a0eedf0910e9956d8796a0aedcd9507dcab668e'
            'b4767f0fe0dd67ab586d0d64d368ff91bb257221d978db207c731c7f5e3a7049'
            '9f27e247cad58b3a91f90921cff4603cdf9e481c13e1c97b035a7f5634208a7e'
            '6d9daadaa1bdc7d1b050e50fa5a887d495c0ecf6770ef9a74b495cd9cbb0ad3f'
            '5d51807b3c8b3b4c1706abbe21d8d64af76ea5d2b9fb33355ffc5f17ce2bbd38'
            '973cc5dbef67522bfb4745fb5b8a3f1c22b82d1ff3124796b5fb5bb5cd429eaa'
            '24349e5cf1089fa26f8e94f0ba66adecba403eb0d13c95eb02441a4306db5ed8'
            '5a784682602f338c7b724c864f0b4f024ff9c4e86ee815124f168e8b94b85002'
            'df8053d234883e21fe59ef7f3c117612be61740f86d392d2b3c3ee2ae314e0a0'
            '78d40d1181bac4f54b111eda7d3bbd1fcb704e36ac44b4e21ea786a1636f9d2e'
            'cb1a593ebd65a06cdc1d6d26f95de5473269130969ce83ca2259948cbf4d6c33')

prepare() {
  cd ${_pkgname}-${pkgver}

  # Enables real transparency on menus
  echo "Applying 01-TranslucentMenus.patch"
  patch --forward --strip=1 --input="${srcdir}/01-TranslucentMenus.patch"

  # Enables different colours on window's borders
  echo "Applying 02-ColourBorders.patch"
  patch --forward --strip=1 --input="${srcdir}/02-ColourBorders.patch"

  # Enables a single pixel rectangle when resizing
  echo "Applying 03-ResizeOutlineThin.patch"
  patch --forward --strip=1 --input="${srcdir}/03-ResizeOutlineThin.patch"

  # Enables other conditions for windows
  echo "Applying 04-Conditionals.patch"
  patch --forward --strip=1 --input="${srcdir}/04-Conditionals.patch"

  # Enables the use of single pixel separators
  echo "Applying 05-FlatSeparators.patch"
  patch --forward --strip=1 --input="${srcdir}/05-FlatSeparators.patch"

  # Adds a border under the titlebar
  echo "Applying 06-BorderUnderTitle.patch"
  patch --forward --strip=1 --input="${srcdir}/06-BorderUnderTitle.patch"
  
  # Enables the use of a different font for Inactive windows
  echo "Applying 07-InactiveFont.patch" 
  patch --forward --strip=1 --input="${srcdir}/07-InactiveFont.patch"

  # Enables the use of FluxboxHandles or RoundedCorners
  echo "Applying 08-FluxRoundedCorners.patch"
  patch --forward --strip=1 --input="${srcdir}/08-FluxRoundedCorners.patch"

  # Sets the top border to a single pixel
  echo "Applying 09-TopBorder.patch"
  patch --forward --strip=1 --input="${srcdir}/09-TopBorder.patch"

  # Sets the width of the title buttons
  echo "Applying 10-ButtonWidth.patch"
  patch --forward --strip=1 --input="${srcdir}/10-ButtonWidth.patch"

  # Enables the use of 8 pixmaps for each border
  echo "Applying 11-MultiBorder.patch"
  patch --forward --strip=1 --input="${srcdir}/11-MultiBorder.patch"

  # Enables the use of tips on FvwmButtons
  echo "Applying 12-FvwmButtonsTips.patch"
  patch --forward --strip=1 --input="${srcdir}/12-FvwmButtonsTips.patch"

  # Enables rounded corners on FvwmIconMan
  echo "Applying 13-FvwmIconMan.patch"
  patch --forward --strip=1 --input="${srcdir}/13-FvwmIconMan.patch"

  # Enables a hover event for buttons
  echo "Applying 14-Hover.patch"
  patch --forward --strip=1 --input="${srcdir}/14-Hover.patch"

  # Menus with titles are opened so that the first item is under the pointer
  #echo "Applying 15-FirstItemUnderPointer.patch"
  #patch --forward --strip=1 --input="${srcdir}/15-FirstItemUnderPointer.patch"

  # The geometry window and proxy windows have a single pixel border
  echo "Applying 16-ThinGeometryProxy.patch"
  patch --forward --strip=1 --input="${srcdir}/16-ThinGeometryProxy.patch"

  # Enables the use of IconSize for MiniIcons
  echo "Applying 17-MiniIconSize.patch"
  patch --forward --strip=1 --input="${srcdir}/17-MiniIconSize.patch"
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --with-stroke-library --enable-mandoc
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/doc/fvwm"
  install -D -m644 ../fvwm.desktop "${pkgdir}/usr/share/xsessions/fvwm.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
