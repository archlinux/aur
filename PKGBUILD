# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=giseditor
pkgver=0.21
pkgrel=1
epoch=
pkgdesc="A gis editor for .gpx .gdb and download maps source"
arch=('any')
url="https://github.com/dayanuyim/GisEditor"
license=()
groups=()
depends=('gpsbabel')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/dayanuyim/GisEditor/archive/v0.21.tar.gz")
noextract=()
md5sums=("23062e0f81f1e15c9d6efa85d58f5f66")
validpgpkeys=()

prepare(){
	mv $srcdir/GisEditor-$pkgver/src/main.py $srcdir/GisEditor-$pkgver/main.py
	echo "--- main.py	2016-05-09 18:31:33.000000000 +0800
+++ /home/yanganto/TestCode/Python/GisEditor/main.py	2016-05-10 09:29:55.556801094 +0800
@@ -1,5 +1,4 @@
-#!/usr/bin/env python3
-# -*- coding: utf8 -*-
+#!/usr/bin/python3
 
 import os
 import subprocess
@@ -24,17 +23,16 @@
 from collections import OrderedDict
 
 #my modules
-import conf
-import util
-import sym
-import coord
-from ui import Dialog, MapSelectDialog, MapSelectFrame
-from gpx import GpsDocument, WayPoint
-from pic import PicDocument
-from util import GeoPoint, getPrefCornerPos, DrawGuard, imageIsTransparent
-from util import AreaSelector, AreaSizeTooLarge, GeoInfo  #should move to ui.py
-from tile import TileAgent, MapDescriptor
-from sym import askSym, toSymbol
+import src.conf as conf
+import src.sym as sym
+import src.coord as coord
+from src.ui import Dialog, MapSelectDialog, MapSelectFrame
+from src.gpx import GpsDocument, WayPoint
+from src.pic import PicDocument
+from src.util import GeoPoint, getPrefCornerPos, DrawGuard, imageIsTransparent
+from src.util import AreaSelector, AreaSizeTooLarge, GeoInfo  #should move to ui.py
+from src.tile import TileAgent, MapDescriptor
+from src.sym import askSym, toSymbol
 
 to_pixel = coord.TileSystem.getPixcelXYByTileXY
 to_tile = coord.TileSystem.getTileXYByPixcelXY" >> $srcdir/main.patch
	patch $srcdir/GisEditor-$pkgver/main.py < $srcdir/main.patch
	rm $srcdir/main.patch

 echo "--- src/conf.py	2016-05-09 18:31:33.000000000 +0800
+++ /home/yanganto/TestCode/Python/GisEditor/src/conf.py	2016-05-10 09:18:02.389123659 +0800
@@ -7,12 +7,12 @@
 from os import path
 from PIL import ImageFont, Image
 from datetime import timedelta
-from coord import CoordinateSystem
+from src.coord import CoordinateSystem
 from configparser import ConfigParser
 from collections import OrderedDict
 
 #default raw data
-import raw
+import src.raw as raw
 
 #constance util
 def _tosymkey(sym):" >> $srcdir/conf.patch
	patch $srcdir/GisEditor-$pkgver/src/conf.py < $srcdir/conf.patch
	rm $srcdir/conf.patch

 echo "--- src/gpx.py	2016-05-09 18:31:33.000000000 +0800
+++ /home/yanganto/TestCode/Python/GisEditor/src/gpx.py	2016-05-10 09:17:33.479215044 +0800
@@ -4,13 +4,13 @@
 
 import os
 import logging
-import util
+import src.util as util
 from xml.etree import ElementTree as ET
 from datetime import datetime
 from PIL import Image
 import xml.dom.minidom
-from coord import TileSystem
-from util import GeoPoint
+from src.coord import TileSystem
+from src.util import GeoPoint
 
 class GpsDocument:
     @property" >> $srcdir/gpx.patch
	patch $srcdir/GisEditor-$pkgver/src/gpx.py < $srcdir/gpx.patch
	rm $srcdir/gpx.patch

 echo "--- src/pic.py	2016-05-09 18:31:33.000000000 +0800
+++ /home/yanganto/TestCode/Python/GisEditor/src/pic.py	2016-05-10 09:19:55.535979188 +0800
@@ -4,10 +4,10 @@
 
 import logging
 from PIL import Image, ExifTags
-from gpx import WayPoint
 from datetime import datetime
 #my
-import sym
+from src.gpx import WayPoint
+import src.sym as sym
 
 class PicDocument(WayPoint):
     @property" >> $srcdir/pic.patch
	patch $srcdir/GisEditor-$pkgver/src/pic.py < $srcdir/pic.patch
	rm $srcdir/pic.patch

 echo "--- src/sym.py	2016-05-09 18:31:33.000000000 +0800
+++ /home/yanganto/TestCode/Python/GisEditor/src/sym.py	2016-05-10 09:16:27.093039433 +0800
@@ -8,8 +8,8 @@
 from PIL import Image, ImageTk
 from math import ceil
 #my
-import conf
-import util
+import src.conf as conf
+import src.util as util
 
 # symbol icon ======================================
 def __getSymIcons(icon_dir):" >> $srcdir/sym.patch
	patch $srcdir/GisEditor-$pkgver/src/sym.py < $srcdir/sym.patch
	rm $srcdir/sym.patch

 echo "--- src/tile.py	2016-05-09 18:31:33.000000000 +0800
+++ /home/yanganto/TestCode/Python/GisEditor/src/tile.py	2016-05-10 09:17:01.832729665 +0800
@@ -22,10 +22,10 @@
 from collections import OrderedDict
 from io import BytesIO
 
-import coord
-import conf
-import util
-from util import mkdirSafely, saveXml
+import src.coord as coord
+import src.conf as conf
+import src.util as util
+from src.util import mkdirSafely, saveXml
 
 to_pixel = coord.TileSystem.getPixcelXYByTileXY
 to_tile = coord.TileSystem.getTileXYByPixcelXY" >> $srcdir/tile.patch
	patch $srcdir/GisEditor-$pkgver/src/tile.py < $srcdir/tile.patch
	rm $srcdir/tile.patch

echo "--- src/ui.py	2016-05-09 18:31:33.000000000 +0800
+++ /home/yanganto/TestCode/Python/GisEditor/src/ui.py	2016-05-10 22:34:45.030053317 +0800
@@ -6,7 +6,6 @@
 import logging
 from PIL import ImageTk
 from tkinter import ttk, messagebox
-from tile import MapDescriptor
 
 class Dialog(tk.Toplevel):
     FOCUSOUT_NOOP = 0
@@ -716,7 +715,7 @@
     import os
     import sys
     sys.path.insert(0, 'src')
-    from tile import MapDescriptor
+    from src.tile import MapDescriptor
 
     root = tk.Tk()" >> $srcdir/ui.patch
	patch $srcdir/GisEditor-$pkgver/src/ui.py < $srcdir/ui.patch
	rm $srcdir/ui.patch

echo "--- src/GisEditor-0.21/src/util.py	2016-05-09 18:31:33.000000000 +0800
+++ /home/yanganto/TestCode/Python/GisEditor/src/util.py	2016-05-10 09:17:31.932555177 +0800
@@ -10,8 +10,8 @@
 from PIL import Image, ImageTk, ImageDraw, ImageColor
 
 #my modules
-import conf
-from coord import TileSystem, CoordinateSystem
+import src.conf as conf
+from src.coord import TileSystem, CoordinateSystem
 
 class DrawGuard:
     def __init__(self, img):" >> $srcdir/util.patch
	patch $srcdir/GisEditor-$pkgver/src/util.py < $srcdir/util.patch
	rm $srcdir/util.patch
	mv $srcdir/GisEditor-$pkgver/conf/sample/sym_rule.conf.sample $srcdir/GisEditor-$pkgver/conf/sym_rule.conf
}
build() {
	echo "TODO: pip install python package here"
}
check(){
	echo "TODO: check gpxbabel path here"
}
package() {
	mkdir -p $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/conf $pkgdir/opt/giseditor
	chmod -R a+x $pkgdir/opt/giseditor/conf
	cp -R $srcdir/GisEditor-$pkgver/data $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/doc $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/icon $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/mapcache $pkgdir/opt/giseditor
	chmod -R a+w $pkgdir/opt/giseditor/mapcache
	cp -R $srcdir/GisEditor-$pkgver/script $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/src $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/main.py $pkgdir/opt/giseditor
	chmod +x $pkgdir/opt/giseditor/main.py 
	echo 'python /opt/giseditor/main.py' > $pkgdir/opt/giseditor/giseditor.sh
	chmod +x $pkgdir/opt/giseditor/giseditor.sh
	mkdir -p $pkgdir/usr/bin
	ln -s $pkgdir/opt/giseditor/giseditor.sh $pkgdir/usr/bin/giseditor

	echo "TODO: install .desktop here and update mime type for os"
}

