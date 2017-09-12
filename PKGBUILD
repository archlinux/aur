# Maintainer: Piotr Rogoza <piotr dot p dot public at gmail dot com>
# Contributor: Arnoud Willemsen <mail at lynthium.com>

pkgname=nginx-devel
_pkgname=nginx
pkgver=1.13.5
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server - development version'
url="http://nginx.org"
arch=(i686 x86_64 armv6h)
declare -A _modulesURL
_configureOptions=()
_add2source() {
  local key=$1 url=$2
  if [ $# -ne 2 ]; then
    return 1
  fi
  _modulesURL+=([$key]="${url}")
}
# naxsi: Application firewall {{{2
# @link https://github.com/nbs-system/naxsi/tags
_naxsi_ver=0.55.3
#_naxsi_url="http://naxsi.googlecode.com/files/naxsi-core-${_naxsi_ver}.tgz"
_naxsi_url="naxsi-${_naxsi_ver}.tar.gz::https://github.com/nbs-system/naxsi/archive/${_naxsi_ver}.tar.gz"
_add2source naxsi $_naxsi_url

# nchan: a scalable, flexible pub/sub server for the modern web, replacment for push module {{{2
# @link: https://nchan.io/
_nchan_ver=1.1.4
_nchan_url="nchan-${_nchan_ver}.tar.gz::https://github.com/slact/nchan/archive/v${_nchan_ver}.tar.gz"

# concat: concatenate files in a given context: CSS and JS files usually {{{2
# @link http://wiki.nginx.org/HttpConcatModule
# @link https://github.com/alibaba/nginx-http-concat/tags
_concat_ver=1.2.2
_concat_url="concat-${_concat_ver}.tar.gz::https://github.com/alibaba/nginx-http-concat/archive/${_concat_ver}.tar.gz"
_add2source concat $_concat_url

# sflow: Operational performance monitoring with standard sFlow protoco {{{2
# @link http://nginx-sflow-module.googlecode.com/
# @link https://github.com/m0zes/nginx-sflow-module
_sflow_ver=0.9.10
_sflow_url="sflow-${_sflow_ver}.tar.gz::https://github.com/m0zes/nginx-sflow-module/archive/release-${_sflow_ver}.tar.gz"
_add2source sflow $_sflow_url

# NgxFancyIndex(git): Like the built-in autoindex module, but fancier {{{2
# @link http://wiki.nginx.org/NgxFancyIndex

# ngx_http_auth_digest(git): HTTP Digest Authentication {{{2
# @link http://wiki.nginx.org/HttpAuthDigestModule

# ngx_http_auth_pam_module: HTTP Basic Authentication using PAM {{{2
# @link http://web.iti.upv.es/~sto/nginx/
# @link https://github.com/stogh/ngx_http_auth_pam_module/
_http_auth_pam_ver=1.5.1
http_auth_pam_url="http_auth_pam-${_http_auth_pam_ver}.tar.gz::https://github.com/stogh/ngx_http_auth_pam_module/archive/v${_http_auth_pam_ver}.tar.gz"
_add2source http_auth_pam $_http_auth_pam_url

# ngx_headers_more: Set and clear input and output headers...more than "add"! {{{2
# @link http://wiki.nginx.org/HttpHeadersMoreModule
# @link https://github.com/openresty/headers-more-nginx-module/releases
_headers_more_ver=0.32
_headers_more_url="headers_more-${_headers_more_ver}.tar.gz::https://github.com/agentzh/headers-more-nginx-module/archive/v${_headers_more_ver}.tar.gz"
_add2source headers_more $_headers_more_url

# ModSecurity: Web application firewall {{{2
# @link http://www.modsecurity.org/projects/modsecurity/nginx/index.html
_modsecurity_ver=2.9.1
_modsecurity_url="http://www.modsecurity.org/tarball/$_modsecurity_ver/modsecurity-apache_${_modsecurity_ver}.tar.gz"
_add2source modsecurity $_modsecurity_url

# PageSpeed {{{2
# @link https://developers.google.com/speed/pagespeed/module/build_ngx_pagespeed_from_source
# @link https://github.com/pagespeed/ngx_pagespeed/releases
_psol_ver=1.12.34.2-beta
_psol_url="psol-${_psol_ver}.tar.gz::https://github.com/pagespeed/ngx_pagespeed/archive/v${_psol_ver}.tar.gz"
_add2source psol $_psol_url
_psol_name="ngx_pagespeed-${_psol_ver}"

# echo-nginx-module {{{2
# @link https://github.com/openresty/echo-nginx-module

#}}}2
depends=(
gd
geoip
gperftools
libatomic_ops
libxslt
pcre
)
makedepends=(
# passenger
psol
geoip
gperftools
libatomic_ops
subversion
)
optdepends=(
"sflowtool: analyzing sFlow data"
)
license=('custom')
install='nginx.install'
backup=(
etc/nginx/fastcgi.conf
etc/nginx/fastcgi_params
etc/nginx/koi-win
etc/nginx/koi-utf
etc/nginx/mime.types
etc/nginx/nginx.conf
etc/nginx/scgi_params
etc/nginx/uwsgi_params
etc/nginx/win-utf
etc/nginx/naxsi.rules
etc/nginx/naxsi_core.rules
etc/logrotate.d/nginx
)
changelog='CHANGES.pkgbuild.md'
# Changes for nginx
# @link http://nginx.org/en/CHANGES
conflicts=(
nginx
nginx-unstable
nginx-svn
nginx-socket
nginx-development-extra
nginx-spdy
)
provides=('nginx')
source=(
http://nginx.org/download/${_pkgname}-${pkgver}.tar.gz
# http://nginx.org/download/${_pkgname}-${pkgver}.tar.gz.asc
nginx.service
nginx.logrotate
naxsi.rules
nginx.conf.example
nginx.socket
${_modulesURL[*]}
)
validpgpkeys=(
)
sha256sums=('0e75b94429b3f745377aeba3aff97da77bf2b03fcb9ff15b3bad9b038db29f2e'
            '05fdc0c0483410944b988d7f4beabb00bec4a44a41bd13ebc9b78585da7d3f9b'
            '272907d3213d69dac3bd6024d6d150caa23cb67d4f121e4171f34ba5581f9e98'
            'e299680e919a97c7ec06b62e4fabc3b5ead837fe486a5f87260bd16d0b51e112'
            '9174cfea524ed4839062dc267d1b561db9f512407682982be42979f98cbdfff7'
            '989b76a9157b7d24788f6b56027d1883d69a744e91d517bca290a88919864b63'
            'c6d9dab8ea1fc997031007e2e8f47cced01417e203cd88d53a9fe9f6ae138720'
            '600b33ffe3404fec319d119b231453fd45a06953a08edef0cde1360415aa2d89'
            '958cc5a7a7430f93fac0fd6f8b9aa92fc1801efce0cda797d6029d44080a9b24'
            '0b3c95d250772dc89ad8b49e47c1e024c5ae2c76c0cffa445e9fe05c4dd13495'
            '1b7d69a9210cf434804eb574618869fba2ddc95d3b0aea7c57205f7a15e920a4'
            '3b27e9eb0478cbba65ba0beb844c5361e2e2f9c21e5bee8803ea9e707f4bbb47')
_addModule() {
  local module=$1 && shift
  local src=$1 && shift

  plain "* $module"

  if [[ "$src" = "github" ]]; then
    src=$(_addGithubModule $module $@)
  elif [[ "$src" =~ ^(https?|ftp):// ]]; then
    src=$(_addExternalModule $module $src)
  elif [[ "$src" =~ ^git:// ]]; then
    src=$(_addGitModule $module $src $@)
  elif [[ "$src" =~ ^svn:// ]]; then
    src=$(_addSvnModule $module $src $@)
  fi

  if [ -d "$src" ]; then
    _configureOptions+=(--add-module=$src)
  fi
}
_addExternalModule() {
  local module=$1
  local src=$2

  [ -d "$module" ] || curl --silent $src | tar -xz

  echo "$(cd "$module" && pwd)"
}
_addGithubModule() {
  local module=$1
  local github_user=$2
  local branch=$3

  [ -d "./$module/.git" ] || git clone -q git://github.com/$github_user/$module.git
  [ -n "$branch" ] && (cd $module && git checkout -q $branch)

  echo "$(cd "$module" && pwd)"
}
_addGitModule() {
  local module=$1
  local src=$2
  local branch=${3:-''}

  [ -d "./$module/.git" ] || git clone -q $src $module
  [ -n "$branch" ] && (cd $module && git checkout -q $branch)
  echo "$(cd "$module" && pwd)"
}
_addSvnModule() {
  local module=$1
  local src=$2
  local name=$3

  if [[ "$src" =~ ^svn://http:// ]]; then
    src=${src:6}
  fi
  svn checkout $src $name
  if [ -n "$name" ]; then
    echo "$(cd "$name" && pwd)"
  else
    echo "$(cd "$module" && pwd)"
  fi
}
#}}}
if (( DEBUG )); then
  set -o nounset
fi
# nginx env, commons for build and package
export _cfgdir=/etc/nginx
export _tmpdir=/var/lib/nginx
export _logdir=/var/log/nginx
build() {
  local _piddir=/run
  local _lockdir=/var/lock
  local _user=http
  local _group=http

  cd ${_pkgname}-$pkgver
#   msg2 "Adding optional systemd socket activation support"
#   patch -Np1 -i "$srcdir/socket.patch"

  _configureOptions=(
    --prefix=$_cfgdir
    --sbin-path=/usr/bin/nginx
    --conf-path=$_cfgdir/nginx.conf
    --error-log-path=$_logdir/error.log
    --pid-path=$_piddir/nginx.pid
    --lock-path=$_lockdir/nginx.lock

    --user=$_user
    --group=$_group

    --with-file-aio
    --with-ipv6
#     --with-systemd

    --http-log-path=$_logdir/access.log
    --http-client-body-temp-path=$_tmpdir/client-body
    --http-proxy-temp-path=$_tmpdir/proxy
    --http-fastcgi-temp-path=$_tmpdir/fastcgi
    --http-uwsgi-temp-path=$_tmpdir/uwsgi
    --http-scgi-temp-path=$_tmpdir/scgi

    --with-debug
    --with-libatomic
    --with-pcre
    --with-pcre-jit
  )
  # Core modules
  _configureOptions+=(
#       --with-rtsig_module
    --with-select_module
    --with-poll_module
#       --with-threads
  )
  # Optional HTTP modules
  _configureOptions+=(
    --with-http_addition_module
    --with-http_degradation_module
    --with-http_perl_module
    --with-http_flv_module
    --with-http_gzip_static_module
    --with-http_image_filter_module
    --with-http_mp4_module
    --with-http_random_index_module
    --with-http_realip_module
    --with-http_secure_link_module
    --with-http_stub_status_module
    --with-http_sub_module
    --with-http_dav_module
    --with-http_gunzip_module

    --with-ld-opt="-lstdc++"
    --with-cpp_test_module

    --with-http_xslt_module
    --with-http_ssl_module
    --with-google_perftools_module
    --with-http_geoip_module
    --with-http_auth_request_module
  )
  # Mail modules
  _configureOptions+=(
    --with-mail
    --with-mail_ssl_module
#     --with-imap                               # deprecated
#     --with-imap_ssl_module                    # deprecated
  )
  # Additional modules from various patch
  _configureOptions+=(
#     --with-http_spdy_module
    --with-http_v2_module
  )

  # Stream
  _configureOptions+=(
    --with-stream
    --with-stream_ssl_module
  )

  _modulesdir="$srcdir/modules"

  msg2 "Configuring modules"

  mkdir -p $_modulesdir
  cd $_modulesdir
#   _addModule passenger /usr/lib/passenger/ext/nginx
  _addModule   naxsi-${_naxsi_ver}     $srcdir/naxsi-core-${_naxsi_ver}/naxsi_src
  _addModule   nchan-${_nchan_ver}     $srcdir/nchan-${_nchan_ver}
  _addModule   concat-${_concat_ver}   $srcdir/nginx-http-concat-${_concat_ver}
  _addModule   ${_psol_name}           $srcdir/$_psol_name}
  # symlink psol library to pagespeed
  if [ ! -L "$srcdir/$_psol_name/include" ]; then
    ln -s /usr/lib/psol/include $srcdir/$_psol_name/include
  fi
  _addModule sflowtool-${_sflow_ver}           $srcdir/nginx-sflow-module-${_sflow_ver}
  _addModule fancyindex-git                    git@github.com:aperezdc/ngx-fancyindex.git
  _addModule http_auth_digest-git              git://github.com/samizdatco/nginx-http-auth-digest
  _addModule http_auth_pam-${_http_auth_pam_ver}    $srcdir/ngx_http_auth_pam_module-${_http_auth_pam_ver}
  _addModule headers_more-${_headers_more_ver} $srcdir/headers-more-nginx-module-${_headers_more_ver}
  _addModule modsecurity-$_modsecurity_ver     modsecurity-apache_${_modsecurity_ver}/nginx/modsecurity
  _addModule echo-nginx-module-git             git://github.com/openresty/echo-nginx-module
#   _addModule owasp-modsecurity-crs             git://github.com/SpiderLabs/owasp-modsecurity-crs.git

  cd "$srcdir"/${_pkgname}-$pkgver
  ./configure ${_configureOptions[*]}
  make
}
package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  sed -e 's|\<user\s\+\w\+;|user html;|g' \
      -e '44s|html|/usr/share/nginx/html|' \
      -e '54s|html|/usr/share/nginx/html|' \
      -i "$pkgdir"/etc/nginx/nginx.conf
  rm "$pkgdir"/etc/nginx/*.default

  install -d "$pkgdir"/$_tmpdir
  install -dm700 "$pkgdir"/$_tmpdir/proxy

  chmod 750 "$pkgdir"/$_logdir
  chown http:log "$pkgdir"/$_logdir

  install -d "$pkgdir"/usr/share/nginx
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

  install -Dm644 "$srcdir"/nginx.logrotate "$pkgdir"/etc/logrotate.d/nginx
  install -Dm644 "$srcdir"/nginx.service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/nginx-devel/LICENSE
#   install -Dm644 "$srcdir"/nginx.socket "$pkgdir"/usr/lib/systemd/system/nginx.socket
  rmdir "$pkgdir"/run

  # man
  install -Dm644 "$srcdir"/${_pkgname}-$pkgver/man/nginx.8 "$pkgdir"/usr/share/man/man8/nginx.8

  # naxsi
  install -Dm644 "$srcdir"/naxsi-${_naxsi_ver}/naxsi_config/naxsi_core.rules \
    "$pkgdir"/${_cfgdir}/naxsi_core.rules
  install -Dm644 "$srcdir"/naxsi.rules "$pkgdir"/${_cfgdir}/naxsi.rules

  install -Dm644 "$srcdir"/nginx.conf.example "$pkgdir"/${_cfgdir}/nginx.conf.example
}
