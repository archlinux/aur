pkgname=blhelisuite32-bin
_pkgname=blhelisuite32
pkgver=1.0.3.7
pkgrel=1
pkgdesc="Configuration tool for BLHeli_32 based ESCs"
arch=('x86_64')
url="https://github.com/bitdump/BLHeli/tree/master/BLHeli_32%20ARM"

options=(!strip)
license=('unknown')
depends=('libcurl-gnutls')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

# Check Google Drive folder: https://drive.google.com/drive/folders/1Y1bUMnRRolmMD_lezL0FYd3aMBrNzCig
# Right click the corresponding file and select "Copy Link" to obtain the sharing link.
GDRIVENAME="BLHeliSuite32xLinux64_1037.zip"
GDRIVELINK="https://drive.google.com/file/d/1k_awtt_ZdaIKHw-bPrbcC9Te6fNkli7H/view?usp=sharing"

GDRIVELINK="https://drive.google.com/uc?export=download&id=$(echo "$GDRIVELINK" | cut -d'/' -f 6)"

# Files larger than 25MB requires confirmation key from cookie.
#CONFIRMKEY=$(/usr/bin/curl -c - -r 0-0 "$GDRIVELINK" --silent -o /dev/null | tee /tmp/bl32cookie | grep -F download_warning | head -n 1 | tr -d '[:space:]' | tail -c 4)
#
#if [ -n "$CONFIRMKEY" ] ; then
#    GDRIVELINK="$GDRIVELINK&confirm=$CONFIRMKEY"
#    DLAGENTS=('https::/usr/bin/curl -b /tmp/bl32cookie -gqb "" -fLC - --retry 3 --retry-delay 3 -o %o %u')
#fi

source=("$GDRIVENAME::$GDRIVELINK")
sha256sums=('c7405a36b7d3f922601e77e3a4269d10b352262b9e8009d7fc5e23577e7a4b4a')

package() {
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r --preserve=all "${srcdir}/BLHeliSuite32xl/." "${pkgdir}/opt/${_pkgname}"
  install -m 777 -d "${pkgdir}/opt/${_pkgname}/Settings/"
  ln -s "/opt/${_pkgname}/BLHeliSuite32xl" "$pkgdir/usr/bin/${_pkgname}"
}
