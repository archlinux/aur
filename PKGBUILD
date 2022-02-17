# Maintainer: kccat <kg.kg.gl+aur at gmail dot com>

pkgname=ttf-opposans
pkgver=20191011
pkgrel=1
pkgdesc="OPPO Sans is a built-in font for ColorOS 7, including Chinese and Latin."
arch=('any')
license=('custom')
url='https://open.oppomobile.com/bbs/forum.php?mod=viewthread&tid=2274'

source=("https://static01.coloros.com/www/public/img/topic7/font-opposans.zip")

sha256sums=('62b1fd121a13e84212fadcc801a1b397927c9d8224351f5b4b93bbcb42b3ad14')

package() {
  # Install fonts
  install -Dt "$pkgdir/usr/share/fonts/${pkgname#ttf-}" -m644 \
    Font-OPPOSans/*.ttf

  cat << EOF > 65-${pkgname#ttf-}.conf
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
  <match target="scan">
    <test name="fullname">
      <string>OPPOSans R</string>
    </test>
    <edit name="weight">
      <const>regular</const>
    </edit>
  </match>
  <match target="scan">
    <test name="fullname">
      <string>OPPOSans B</string>
    </test>
    <edit name="weight">
      <const>bold</const>
    </edit>
  </match>
  <match target="scan">
    <test name="fullname">
      <string>OPPOSans H</string>
    </test>
    <edit name="weight">
      <const>heavy</const>
    </edit>
  </match>
  <match target="scan">
    <test name="fullname">
      <string>OPPOSans L</string>
    </test>
    <edit name="weight">
      <const>light</const>
    </edit>
  </match>
  <match target="scan">
    <test name="fullname">
      <string>OPPOSans M</string>
    </test>
    <edit name="weight">
      <const>medium</const>
    </edit>
  </match>
</fontconfig>
EOF

  # Install fontconfig
  local fcdir="$pkgdir/usr/share/fontconfig"
  install -Dt "$fcdir/conf.avail" -m644 *.conf
  mkdir -p "$fcdir/conf.default"
  ln -srt "$fcdir/conf.default" "$fcdir"/conf.avail/*
}

# vim:set sw=2 et:
