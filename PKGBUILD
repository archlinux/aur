# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kevin Baxmann <kvbx@kvbx.de>
# Contributor: Arne Hoch <arne@derhoch.de>

pkgname=sqlcl
pkgver='23.3.0.270.1251'
pkgrel=1
pkgdesc='SQL Developer command line interface for Oracle'
arch=('any')
url='https://www.oracle.com/database/sqldeveloper/technologies/sqlcl'
license=('custom')
changelog=CHANGELOG.md
depends=('bash' 'java-runtime>=8')
source=("$pkgname-$pkgver.zip::https://download.oracle.com/otn_software/java/sqldeveloper/$pkgname-$pkgver.zip"
        "$pkgname.sh")
sha256sums=('4e442432d09329475f571f6c7c025524fe2701a4261b848371dbb06857c0106b'
            '34c5f2be48639dcd8ec9f38f950916a394ae399a0e583fbde4020acdccf951e0')

package() {
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$pkgname/bin/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$pkgname/third-party-licenses.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"

    rm "$pkgname"/{README.md,Release-Notes.md,third-party-licenses.txt} \
       "$pkgname"/bin/{license.txt,README.md,sql.exe}

    install -d "$pkgdir/opt/$pkgname/"
    cp -a "$pkgname"/* "$pkgdir/opt/$pkgname/"
}
