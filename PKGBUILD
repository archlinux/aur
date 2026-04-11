# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=nextcloud-git
_pkgname=nextcloud
pkgver=33.0.2.r73.ge9befeb1045
_tbranch=stable33 # adjust if the repo package moves up
pkgrel=1
pkgdesc="A cloud server to store your files centrally on a hardware controlled by you"
arch=(any)
url="https://nextcloud.com"
license=(AGPL-3.0-or-later)
depends=(
  php-legacy-gd
  php-legacy
)
optdepends=(
  'curl: for webcron jobs from within uwsgi'
  'ffmpeg: for preview generation'
  'libreoffice: for preview generation'
  'mariadb: to use a local MariaDB server'
  'memcached: to use a local memcached server'
  'mod_itk: to use the Apache web server'
  'php-legacy-apache: to use the Apache web server'
  'php-legacy-apcu: for caching with APCU'
  'php-legacy-fpm: to run in fastCGI process manager'
  'php-legacy-imagick: for preview generation'
  'php-legacy-memcached: for caching with memcached'
  'php-legacy-pgsql: to use the PostgreSQL database backend'
  'php-legacy-redis: for caching with redis'
  'php-legacy-sodium: for Argon2 password hashing'
  'php-legacy-sqlite: to use the SQLite database backend'
  'postgresql: to use a local PostgreSQL server'
  'valkey: to use a local Redis server'
  'smbclient: for SMB/CIFS integration'
  'sudo: for privilege elevation in occ command when not run as root'
  'uwsgi-plugin-php-legacy: run as application container'
)
backup=(
  etc/webapps/$_pkgname/config/config.php
  etc/webapps/$_pkgname/.htaccess
  etc/uwsgi/$_pkgname.ini
)
# there are no elf files, no need to strip anything
options=(!strip)
install=$_pkgname.install
provides=('nextcloud')
conflicts=('nextcloud')
source=(
  ${_pkgname}::git+https://github.com/nextcloud/server.git#branch=$_tbranch
  apache.example.conf
  $_pkgname.config.php
  $_pkgname.hook
  $_pkgname.occ.sh
  $_pkgname.sysusers
  $_pkgname.tmpfiles
  $_pkgname.uwsgi
  $_pkgname-cron.service
  $_pkgname-cron.timer
)
sha512sums=('SKIP'
            '5f9be223225e6ad2772989c440df8585a852ea0be697274384064ec73df47dab2f5d0847c275732fab26c419a713911d8f77ebc2b639bf6e8ede76272b752cde'
            '92592f9a76ee534d0ae6d3aedf2257c147337debe7e2d6dbec1daff66a682e3abc74611e08662058de314bf3ea6ff1c85efd678674b782d71251c38786e446f9'
            '2791382d7b005c64cd6938695f273e83435cc5f1b785fe7d44d6dbd69864c502847e45d93c4a5f6752a759a660118279e3e22e5bc32f79b8775693fde603a9c5'
            'b54b5a9957f846842603677b21fa79628ab69b5b7e05913dcf631ae2b4fd11d09822429900ab0efc6e75e83f85cc0d8e7d53eb6a4c91e08148ddbed235b2453b'
            '435c663eed580b214dab1ad0123a789d9a0726185e6d1baa9f4707d663527edbea5d9c7fca0feab2c005b1298ce3789177cc8c9fdfe8518c1652f7c218f32b2d'
            '919008a2bf6cf2492cb1e9c8e28c1e082d74e45da5a96e6669f8971d6cf721e36d23625c89918fe10d8bc1b202c0340aa897849d9ec501a26f3f4572ccb57a98'
            '702bc3d36068df95a7f9960633fb8036e83c8c9c24f93ebdb75b241220773bbf75c10ce4dba0aeb97b3cf5ab3f0b09adcf1e045b0ca51089682ff9fdf91d04f4'
            '3d3e22841bbae0b910c1d1dc9cccfff1182f5fd569c39ae76ca7f3828de31d5d91bf0d28524dd397171f027046bfb193845ecfc06bd0abbbc79899acb26306bb'
            'eb69785a5b0df0e2a11f53f9c2e2dbf75681d7c698e88cbcc5ceed713a558d528511cc576813cc083cbaa28a2c83d543a39436ad4805670348ef22634305b1c8')
b2sums=('SKIP'
        '7d40d120c28291f1a7537f3e1b5049fa83c9c0af949371345ea9ccdf3de4a0f3a3a06edbc52d9254dba483e4d11acf562cf679b9e379c5dfc2f61dfbfc2e4cef'
        '4ad061efbc20b4d0e9f8cfd01c5e8e612fa5af29bce754b77f90c1835b98ee445ef4de3d8c83da91461053622620af14d880eb9014b51f2383c75f1860d479f4'
        'c69f18de513562e32f0f655fee7ef81877d74a76717e2eaad9a13882bf8edd0dad99bec5958e460a4ec32eecfdd425ae009d11ac27af16a3ad1d6498282be32f'
        'c5c4499f588c2b4d90223c00b2c1e575611d4c90c5077d3199cfcdad455ad55ab34db66159ad2c42a2f56db87a844f60ff4cdfd2fdb14df3a52f44e376dd2e3e'
        '7b59533ac4e5468cfee0e3572811a3f8684a09dbb2f193d8ce42cf4ed0963a64a23c298f25663f05478fc1ef0e4b5c3e9f6e38b313a09e53736611d343f7a5d6'
        'd132044cb7f1d61a1ce87800d2e1142e3ac385acdec25e2f5ad685603a0ffa88e105f4c35688584d65d287adbb40b8d9a02d6a80d7a0b58bb8801a6769405218'
        '71cf8915d34104b2bef91d54bbaeb5c346abe3845a5865ce11fc80b7ce56e7fe854e880977cf87c50b409b503ef68e8ff08048c919b9b717f0c9d8ed6947def1'
        '3478252d09c5283dc148836e8a1bc6520bee40b19fe9d98c40ef1240b6ede20d8f397400a9901fb188bcf5859bda19e4fe0454ae30aa00d494cdb467ccaf3fc3'
        'e6214351ca16bfe97683e838e727d6b5eaa62194878272204034c62aac4a632c9b33cd31aa0570c2eb936d7e9e7ff60190ac05a3a8cc2e27eda423a7d89b6d39')
validpgpkeys=('28806A878AE423A28372792ED75899B9A724937A') # Nextcloud Security <security@nextcloud.com>

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cd $_pkgname
  git submodule update --init
}

check() {
  local php_version="$(grep -Po 'PHP_VERSION_ID \K[^"]*' /usr/include/php-legacy/php/main/php_version.h)"
  local nextcloud_php_min="$(sed -nr 's/^.*PHP_VERSION_ID < ([0-9]*).*$/\1/p' $pkgname/lib/versioncheck.php)"
  local nextcloud_php_max="$(sed -nr 's/^.*PHP_VERSION_ID >= ([0-9]*).*$/\1/p' $pkgname/lib/versioncheck.php)"

  printf "Found php version %s.\n" "$php_version"
  printf "Nextcloud's php minimum version requirement: %s\n" "$nextcloud_php_min"
  printf "Nextcloud's php maximum version requirement: %s\n" "$nextcloud_php_max"

  if (( "$(vercmp "$php_version" "$nextcloud_php_min")" <= 0 )); then
    printf "%s requires php >= %s, but %s is provided\n" "$pkgname" "$nextcloud_php_min" $php_version >&2
    exit 1
  fi
  if (( "$(vercmp "$php_version" "$nextcloud_php_max")" > 0 )); then
    printf "%s requires php < %s, but %s is provided\n" "$pkgname" "$nextcloud_php_max" "$php_version" >&2
    exit 1
  fi
}

package() {
  cd $_pkgname
  # sysusers.d integration
  install -vDm 644 ../$_pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  # tmpfiles.d integration
  install -vDm 644 ../$_pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  # state dir for data and writable apps
  install -vdm 755 "$pkgdir/var/lib/$_pkgname/"
  install -vdm 770 "$pkgdir/var/lib/$_pkgname/data"
  install -vdm 755 "$pkgdir/var/lib/$_pkgname/apps"
  # log dir
  install -vdm 755 "$pkgdir/var/log/$_pkgname/"
  # uwsgi integration
  install -vDm 644 ../$_pkgname.uwsgi "$pkgdir/etc/uwsgi/$_pkgname.ini"
  # config dir
  install -vDm 644 .htaccess -t "$pkgdir/etc/webapps/$_pkgname/"
  install -vDm 640 ../$_pkgname.config.php "$pkgdir/etc/webapps/$_pkgname/config/config.php"
  find config -type f -exec install -vDm 644 {} "$pkgdir/etc/webapps/$_pkgname/"{} \;
  # remove config dir and .htaccess from source so that it is not installed to default location
  rm -rf config .htaccess

  # webapp
  find . \( -type f -or -type l \) -not -iname "*.orig" -exec install -vDm 644 {} "$pkgdir/usr/share/webapps/$_pkgname/"{} \;

  # symlink config directory into place
  ln -sv /etc/webapps/$_pkgname/config "$pkgdir/usr/share/webapps/$_pkgname/"
  # symlink .htaccess file into place
  ln -sv /etc/webapps/$_pkgname/.htaccess "$pkgdir/usr/share/webapps/$_pkgname/"
  # add symlink to default writable apps directory
  ln -sv /var/lib/$_pkgname/apps "$pkgdir/usr/share/webapps/$_pkgname/wapps"
  # install occ command
  install -vDm 755 occ -t "$pkgdir/usr/share/webapps/$_pkgname/"
  # occ script
  install -vDm 755 ../$_pkgname.occ.sh "$pkgdir/usr/bin/occ"
  # optional pacman hook
  install -vDm 644 ../$_pkgname.hook -t "$pkgdir/usr/share/doc/$_pkgname/"
  # apache example conf
  install -vDm 644 ../apache.example.conf -t "$pkgdir/usr/share/doc/$_pkgname/"
  # systemd service
  install -vDm 644 ../$_pkgname-cron.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 ../$_pkgname-cron.timer -t "$pkgdir/usr/lib/systemd/system/"
}
