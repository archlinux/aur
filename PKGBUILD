# Maintainer: Harry Larsson <h@gkd.pw>
# Maintainer: Savino Jossi <savino.jossi@gmail.com>

_pkgname=scientifica
pkgname=scientifica-font
pkgver=1.0.4
pkgrel=2
pkgdesc='Tall and condensed bitmap font for geeks.'
license=('SIL')
arch=(any)
url='https://github.com/NerdyPepper/scientifica'
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
install=scientifica-font.install
_gitrepo='https://raw.githubusercontent.com/NerdyPepper'
source=("${_gitrepo}/scientifica/master/regular/scientifica-11.bdf"
        "${_gitrepo}/scientifica/master/bold/scientificaBold-11.bdf"
        "${_gitrepo}/scientifica/master/LICENSE")
md5sums=('69560467cea171345f88649f9086d477'
         '8302661686292da3b2fffc21c561fb21'
         '77b104b57cdfb5a0e62b76a0057009df')

build(){
  cd ${srcdir}
  msg2 "Creating font config files..."
  cat > 75-yes-scientifica.conf << EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<!-- Accept scientifica font -->
  <selectfont>
   <acceptfont>
      <pattern>
  	  <patelt name="family">
  		<string>scientifica</string>
  	  </patelt>
  	</pattern>
    </acceptfont>
  </selectfont>
</fontconfig>
EOF
}

package() {
  cd ${srcdir}
  _bdfdir=/usr/share/fonts/misc
  _avail=/etc/fonts/conf.avail
  _license=/usr/share/licenses

  msg2 "Installing bitmap font files..."
  install -d "${pkgdir}${_bdfdir}"
  install -m0644 *.bdf "${pkgdir}${_bdfdir}/"

  msg2 "Installing font config files..."
  install -d "${pkgdir}${_avail}"
  install -m0644 *.conf "${pkgdir}${_avail}/"

  msg2 "Installing license..."
  install -d "${pkgdir}${_license}/${pkgname}"
  install -D -m0644 "LICENSE" \
    "${pkgdir}${_license}/${pkgname}/"
}
