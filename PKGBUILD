# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: amo <https://aur.archlinux.org/account/amo>

pkgname="paperless-ngx"
pkgver=2.0.0
pkgrel=1
pkgdesc="A supercharged version of paperless: scan, index and archive all your physical documents"
url="https://docs.paperless-ngx.com/"
license=("GPL3")
arch=("any")
provides=("paperless" "$pkgname")
conflicts=("paperless" "paperless-ng")
depends=("file"
         "gnupg"
         "gunicorn"
         "imagemagick"
         "mailcap"
         "nltk-data"
         "ocrmypdf"
         "optipng"
         "redis"
         "sqlite"
         "tesseract-data-eng"
         "ttf-liberation"
         "uvicorn"
         "python-aiohttp"
         "python-arrow"
         "python-asgiref"
         "python-async-timeout"
         "python-attrs"
         "python-autobahn"
         "python-automat"
         "python-blessed"
         "python-brotli"
         "python-celery"
         "python-certifi"
         "python-django-channels"
         "python-django-channels-redis"
         "python-chardet"
         "python-click"
         "python-concurrent-log-handler"
         "python-constantly"
         "python-daphne"
         "python-dateparser"
         "python-django"
         "python-django-auditlog"
         "python-django-celery-results"
         "python-django-compression-middleware"
         "python-django-cors-headers"
         "python-django-extensions"
         "python-django-filter"
         "python-django-guardian"
         "python-django-multiselectfield"
         "python-django-picklefield"
         "python-django-rest-framework"
         "python-django-rest-framework-guardian"
         "python-drf-writable-nested"
         "python-filelock"
         "python-fuzzywuzzy"
         "python-gotenberg-client"
         "python-h11"
         "python-hiredis"
         "python-httptools"
         "python-humanfriendly"
         "python-hyperlink"
         "python-idna"
         "python-imap-tools"
         "python-incremental"
         "python-inotify-simple"
         "python-inotifyrecursive"
         "python-ipware"
         "python-joblib"
         "python-langdetect"
         "python-lxml"
         "python-msgpack"
         "python-pathvalidate"
         "python-pdf2image"
         "python-portalocker"
         "python-psycopg2"
         "python-pyasn1"
         "python-pyasn1-modules"
         "python-pycparser"
         "python-pyopenssl"
         "python-dateutil"
         "python-dotenv"
         "python-gnupg"
         "python-levenshtein"
         "python-magic"
         "python-nltk"
         "python-pytz"
         "python-redis"
         "python-regex"
         "python-requests"
         "python-scikit-learn"
         "python-scipy"
         "python-service-identity"
         "python-six"
         "python-sortedcontainers"
         "python-sqlparse"
         "python-threadpoolctl"
         "python-tika-client"
         "python-twisted"
         "python-txaio"
         "python-tzlocal"
         "python-urllib3"
         "python-uvloop"
         "python-watchdog"
         "python-watchgod"
         "python-wcwidth"
         "python-websockets"
         "python-whitenoise"
         "python-whoosh"
         "python-yaml"
         "python-zope-interface"
         "python-zstandard"
         "pyzbar")
optdepends=("jbig2enc: smaller PDF size"
            "postgresql: postgres database"
            "mariadb: mariadb database"
            "python-mysqlclient: connect to mariadb"
            "python-flower: celery monitoring")
source=("https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz"
        "paperless.hook"
        "paperless.sysusers"
        "paperless.tmpfiles"
        "paperless.target"
        "paperless-consumer.service"
        "paperless-scheduler.service"
        "paperless-task-queue.service"
        "paperless-webserver.service")
b2sums=('74bc0233df12d51ca9e3c052c8b6cdbde2c4d51d673a359c2669d2dfb7800717d553a1a89ae86509075192a7e29cec95f256d07e697f9dc30732dcc7f2c50b76'
        '66073b686ac143f5b6a2c581705ca77a90b48e5ad03208c61976e0421e54c08bb5ce8168a42cd1f11d9f34e270a27ee91102c5fbf5477fdb5a596ad7b38e5750'
        '586ad775e26aef216716c33d8951e00044a7f6866167d27dceab39d51b4fd46527693dfe4e085dc20d2e9193679122ad2b9ac8a1c03a98df747af15ecca24ca2'
        '4a59f0a0c6a4abad23cba01e216909f45a7064e93911b8ba3e3b394f52379e41898b8c9e1246ba034bc8d2fe6dc83f5cad926e265a17da7c7093d997cfe8b4f3'
        'd4eff17cf6b4642211d61545d3722cb626e35b591fc1f11dfc0d4bd3b303ac145777953d405b1bbdf6473512590d50169cf58db8251de2701cee4d7b151ef6be'
        '22789413306028dae8ffbc791599a2f008412417930d093e198157b7d7955be7f386cea550172b5772738106308682d310d7278495087ffd94c257407328aa1a'
        '6c09b9149a3f81494efc8bc851585f5dd183f8a719797e3996710d90bc77e1219bae22c263a79db498dfda6a17f4539784d850dae8b8d5e25b9ef1e7c8ca211f'
        'a769a96485e8f9846ef0089531bda7488a23138fc6b4e7ddaf9cf29cd47281d6c02574a91b40645e3cc35be7f2095c3bbec678250158accc1b644ecf4bad26cd'
        'e464a1bb7bdfaa5b3afcefdf84cd8699ef2bbc06d7f4e38915bd04e2d5f6049574d88ca74589832630cf2326279bc7374271a106a4b1fb8b10f2a8f5182f8d8b')
backup=("etc/paperless.conf")
options=("!strip")
install="paperless.install"

prepare(){
 # use arch linux canonical paths
 sed -i "$pkgname/paperless.conf" \
     -e "s|#PAPERLESS_CONSUMPTION_DIR=../consume|PAPERLESS_CONSUMPTION_DIR=/var/lib/paperless/consume|" \
     -e "s|#PAPERLESS_DATA_DIR=../data|PAPERLESS_DATA_DIR=/var/lib/paperless/data|" \
     -e "s|#PAPERLESS_MEDIA_ROOT=../media|PAPERLESS_MEDIA_ROOT=/var/lib/paperless/media|" \
     -e "s|#PAPERLESS_STATICDIR=../static|PAPERLESS_STATICDIR=/usr/share/paperless/static|" \
     -e "s|#PAPERLESS_CONVERT_TMPDIR=/var/tmp/paperless|PAPERLESS_CONVERT_TMPDIR=/var/lib/paperless/tmp|"
 # remove hardcoded bind address
 sed -i "$pkgname/gunicorn.conf.py" \
     -e "s|bind = '0.0.0.0:8000'||"
 # add custom dir for uploaded files
 printf "\n# Uploads\n\nPAPERLESS_SCRATCH_DIR=/var/lib/paperless/uploads" >> "$pkgname/paperless.conf"
 # add customizable bind address, will be used by paperless-webserver.service
 printf "\n\n# Webserver\n\nGUNICORN_CMD_ARGS='--bind=127.0.0.1:8000'" >> "$pkgname/paperless.conf"
}

package(){
 # program files
 install -d "$pkgdir/usr/share/paperless" "$pkgdir/usr/bin"
 cp -R "$pkgname"/* "$pkgdir/usr/share/paperless"
 # main executable
 chmod 755 "$pkgdir/usr/share/paperless/src/manage.py"
 ln -s "/usr/share/paperless/src/manage.py" "$pkgdir/usr/bin/paperless-manage"
 # config file
 install -D -m 640 "$pkgname/paperless.conf" "$pkgdir/etc/paperless.conf"
 rm "$pkgdir/usr/share/paperless/paperless.conf"
 ln -s "/etc/paperless.conf" "$pkgdir/usr/share/paperless/paperless.conf"
 # optional pacman hook
 install -D -m 644 "paperless.hook" "$pkgdir/usr/share/paperless/docs/paperless.hook"
 # user and files to create, ownership and permission to set
 install -D -m 644 "paperless.sysusers" "$pkgdir/usr/lib/sysusers.d/paperless.conf"
 install -D -m 644 "paperless.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/paperless.conf"
 # service files
 install -D -m 644 "paperless.target" "$pkgdir/usr/lib/systemd/system/paperless.target"
 install -D -m 644 "paperless-consumer.service" "$pkgdir/usr/lib/systemd/system/paperless-consumer.service"
 install -D -m 644 "paperless-scheduler.service" "$pkgdir/usr/lib/systemd/system/paperless-scheduler.service"
 install -D -m 644 "paperless-task-queue.service" "$pkgdir/usr/lib/systemd/system/paperless-task-queue.service"
 install -D -m 644 "paperless-webserver.service" "$pkgdir/usr/lib/systemd/system/paperless-webserver.service"
}
