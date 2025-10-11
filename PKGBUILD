# Maintainer: Geonho Kim <ghkim@muphix.com>
#
# PKGBUILD notes:
# - Based on upstream un-fonts 1.0.2 (080608).
# - Based on Debian's fonts-unfonts-extra packaging.
#   - Fontconfig snippet for improved rendering
#   - fsType cleanup (SetOS2Value("FSType",0)) to ensure installable embedding
#     for GPL fonts.
#   - Wrong Subfamily name fix (SetTTFName(0x409,2,""))
#     (UnYetgul: Bold -> Regular)
#
_pkgver_pre=1.0.2
_pkgver_post=080608
_source_file_pre=2608
_source_file="${_source_file_pre}-un-fonts-extra-${_pkgver_pre}-${_pkgver_post}.tar.gz"

pkgname=ttf-unfonts-extra
pkgver=${_pkgver_pre}.${_pkgver_post}
pkgrel=1
pkgdesc='Un series Korean TrueType fonts (extra set)'
arch=('any')
url='https://kldp.net/unfonts/'
license=('GPL-2.0-only')
makedepends=('fontforge')
source=("${pkgname}-${pkgver}.tar.gz::https://kldp.net/unfonts/release/${_source_file}")
sha256sums=('32a56acc06f264653bd151ec48c0811d07c198c2561e9f2efa8845e45b6b7407')

_ttfs=()
_fc='90-fonts-unfonts-extra.conf'

prepare() {
  cd "$srcdir/un-fonts"

  mapfile -d '' _ttfs < <(find . -type f -iname '*.ttf' -print0)

  # Fix wrong Subfamily name
  fontforge -lang=ff \
      -c 'Open($1); SetTTFName(0x409,2,"Regular"); Generate($1)' \
          './UnYetgul.ttf'

  # Cleanup fsType in OS/2 table
  for i in "${_ttfs[@]}"; do
    fontforge -lang=ff -c 'Open($1); SetOS2Value("FSType",0); Generate($1)' "$i"
  done

  # Build fontconfig for improved rendering
  cat > "$_fc" <<'EOF'
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="font">
    <test name="family" qual="any">
      <string>UnJamoBatang</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnJamoDotum</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnJamoNovel</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnJamoSora</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnPen</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnPenheulim</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnPilgia</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnShinmun</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnTaza</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnVada</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnYetgul</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
</fontconfig>
EOF
}

package() {
  cd "$srcdir/un-fonts"

  mapfile -d '' _ttfs < <(find . -type f -iname '*.ttf' -print0)

  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" "${_ttfs[@]}"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" 'README'
  install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail/" "$_fc"
  install -d "$pkgdir/usr/share/fontconfig/conf.d/"
  ln -s "../conf.avail/$_fc" "$pkgdir/usr/share/fontconfig/conf.d/$_fc"
}
# vim:set ft=sh ts=2 sw=2 et:
