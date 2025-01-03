# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="workout-tracker-bin"
_pkgname="${pkgname%-bin}"
pkgver=1.18.1
pkgrel=1
pkgdesc="A workout tracking web application for personal use (or family, friends), geared towards running and other GPX-based activities"
url="https://github.com/jovandeginste/workout-tracker"
license=("MIT")
arch=("x86_64" "aarch64")
source=("$_pkgname.sysusers"
        "$_pkgname.tmpfiles"
        "$_pkgname.service"
        "$_pkgname.env"
        "https://raw.githubusercontent.com/jovandeginste/workout-tracker/master/LICENSE")
source_x86_64=("https://github.com/jovandeginste/workout-tracker/releases/download/v$pkgver/workout-tracker-v$pkgver-linux-amd64.tar.gz")
source_aarch64=("https://github.com/jovandeginste/workout-tracker/releases/download/v$pkgver/workout-tracker-v$pkgver-linux-arm64.tar.gz")
b2sums=('ec89bbd6656597e4723381b78c57e0a508f8a1d35291553f6c57f0a9f507ea0fb19e4b9d16ea739b9a5e073abf1fb09f1eb8e4cee90d050a64e9dc17ac6a0a6b'
        'a124ab550c577815d570347ed74f43ad84b85bd5639464447e24e396aa1b96774557bf09fbbe3a6909113b3aa74b8fd028ee6f0fac8ff5a3a9274096b2744fc8'
        'fa90f14f6cacbe15a3a253372325ac263f66fd6a90118434b26831939c7a9cb1025e4a867e9c301f08f7527c5b06e9cbdee6ecac3fb2fd52215785408264b756'
        '3a7041fcbe36b7e15e69e303dcbf56ebd0b674d335128b456d4aca80590f992cc4707a0dce24691395070d4b4fc4cde7c9df1d8a654a367dd9125b7712a46c24'
        '52f16826f65e2fd13f3dd2158f6c0f934de1c39e546bac4e088a5bb478e33216225c11f9c10710a7efdb9fdec6ea44f5967f61be44dded86fecef5cd88435639')
b2sums_x86_64=('00cde4ee762f8feea9fa1a8870ce30ce37be56b90cafcaccf3f780ab7b1f08a55b46309d9cdca5cfc2dac3f4bf761b1b64bc83cf441d7446935d3e838afbc3e3')
b2sums_aarch64=('fca73943afb2fd53956633637cd2135e11e5b898a12b3493c7e78f20dcdf230cc57cb430783db7d6313feb754ae56369210fa496eb90546f7e2f6a2294ebaded')
backup=("etc/$_pkgname/env")
install="$_pkgname.install"

package(){
 # binary
 install -D -m 755 "$_pkgname"                      "$pkgdir/usr/bin/$_pkgname"
 # app data
 install -d -m 750                                  "$pkgdir/var/lib/$_pkgname"
 # configuration
 install -d -m 750                                  "$pkgdir/etc/$_pkgname"
 install -D -m 640 "$_pkgname.env"                  "$pkgdir/etc/$_pkgname/env"
 # systemd
 install -D -m 644 "$srcdir/$_pkgname.service"      "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
 install -D -m 644 "$srcdir/$_pkgname.sysusers"     "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
 install -D -m 644 "$srcdir/$_pkgname.tmpfiles"     "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
 # license
 install -D -m 644 "LICENSE"                        "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
